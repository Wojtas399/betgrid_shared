from google.cloud.firestore import Client
from typing import List
from models import (
    SeasonGrandPrixBet,
    SeasonGrandPrixBetPoints,
    RaceBetPoints,
    UserStats,
    UserStatsPointsForSeasonGp,
    UserStatsPointsForDriver,
)
from service.data import (
    UserStatsDataService,
    SeasonDriverDataService,
)


class UserStatsService:
    def __init__(self, db_client: Client):
        self.user_stats_data_service = UserStatsDataService(db_client)
        self.season_driver_data_service = SeasonDriverDataService(db_client)

    def update_user_stats(
        self,
        user_id: str,
        season: int,
        season_gp_bet: SeasonGrandPrixBet,
        season_gp_bet_points: SeasonGrandPrixBetPoints,
    ):
        user_stats: UserStats = self.user_stats_data_service.load_for_user_and_season(
            user_id=user_id,
            season=season,
        )

        updated_best_gp_points = self.__update_best_gp_points(
            season_gp_id=season_gp_bet_points.season_grand_prix_id,
            best_gp_points=user_stats.best_gp_points,
            gp_points=season_gp_bet_points.total,
        )
        updated_best_quali_points = (
            self.__update_best_quali_points(
                season_gp_id=season_gp_bet_points.season_grand_prix_id,
                best_quali_points=user_stats.best_quali_points,
                quali_points=season_gp_bet_points.quali.total,
            )
            if season_gp_bet_points.quali is not None
            else user_stats.best_quali_points
        )
        updated_best_race_points = (
            self.__update_best_race_points(
                season_gp_id=season_gp_bet_points.season_grand_prix_id,
                best_race_points=user_stats.best_race_points,
                race_points=season_gp_bet_points.race.total,
            )
            if season_gp_bet_points.race is not None
            else user_stats.best_race_points
        )
        updated_points_for_drivers = self.__update_points_for_drivers(
            season=season,
            points_for_drivers=user_stats.points_for_drivers,
            season_gp_bet=season_gp_bet,
            season_gp_bet_points=season_gp_bet_points,
        )
        updated_total_points = user_stats.total_points + season_gp_bet_points.total

        updated_user_stats = UserStats(
            best_gp_points=updated_best_gp_points,
            best_quali_points=updated_best_quali_points,
            best_race_points=updated_best_race_points,
            points_for_drivers=updated_points_for_drivers,
            total_points=updated_total_points,
        )

        self.user_stats_data_service.update_for_user_and_season(
            user_id=user_id,
            season=season,
            updated_user_stats=updated_user_stats,
        )

    def __update_best_gp_points(
        self,
        season_gp_id: str,
        best_gp_points: UserStatsPointsForSeasonGp | None,
        gp_points: float,
    ):
        return (
            UserStatsPointsForSeasonGp(
                season_grand_prix_id=season_gp_id,
                points=gp_points,
            )
            if (
                best_gp_points is None or
                gp_points > best_gp_points.points
            )
            else best_gp_points
        )

    def __update_best_quali_points(
        self,
        season_gp_id: str,
        best_quali_points: UserStatsPointsForSeasonGp | None,
        quali_points: float,
    ):
        return (
            UserStatsPointsForSeasonGp(
                season_grand_prix_id=season_gp_id,
                points=quali_points,
            )
            if (
                best_quali_points is None or
                quali_points > best_quali_points.points
            )
            else best_quali_points
        )

    def __update_best_race_points(
        self,
        season_gp_id: str,
        best_race_points: UserStatsPointsForSeasonGp | None,
        race_points: float,
    ):
        return (
            UserStatsPointsForSeasonGp(
                season_grand_prix_id=season_gp_id,
                points=race_points,
            )
            if (
                best_race_points is None or
                race_points > best_race_points.points
            )
            else best_race_points
        )

    def __update_points_for_drivers(
        self,
        season: int,
        points_for_drivers: List[UserStatsPointsForDriver] | None,
        season_gp_bet: SeasonGrandPrixBet | None,
        season_gp_bet_points: SeasonGrandPrixBetPoints,
    ):
        all_season_drivers_ids = (
            self.season_driver_data_service.load_ids_of_all_drivers_from_season(
                season=season,
            )
        )

        existing_points_for_drivers = points_for_drivers
        if existing_points_for_drivers is None:
            existing_points_for_drivers = [
                UserStatsPointsForDriver(
                    season_driver_id=season_driver_id,
                    points=0.0,
                )
                for season_driver_id in all_season_drivers_ids
            ]

        updated_points_for_drivers = []
        for season_driver_id in all_season_drivers_ids:
            existing_points: UserStatsPointsForDriver = next(
                (
                    points_for_single_driver for
                    points_for_single_driver in existing_points_for_drivers if
                    points_for_single_driver.season_driver_id == season_driver_id
                ),
            )
            new_points = self.__get_points_for_driver(
                season_driver_id=season_driver_id,
                season_gp_bet=season_gp_bet,
                season_gp_bet_points=season_gp_bet_points,
            ) if season_gp_bet is not None else 0.0

            updated_points_for_drivers.append(
                UserStatsPointsForDriver(
                    season_driver_id=season_driver_id,
                    points=existing_points.points + new_points,
                )
            )

        return updated_points_for_drivers

    def __get_points_for_driver(
        self,
        season_driver_id: str,
        season_gp_bet: SeasonGrandPrixBet,
        season_gp_bet_points: SeasonGrandPrixBetPoints,
    ):
        points_for_quali = self.__get_points_for_season_driver_for_quali(
            season_driver_id=season_driver_id,
            quali_standings_by_season_driver_ids=season_gp_bet.quali_standings_by_season_driver_ids,
            season_gp_bet_points=season_gp_bet_points,
        ) if season_gp_bet_points.quali is not None else 0.0
        points_for_race = self.__get_points_for_season_driver_for_race(
            season_driver_id=season_driver_id,
            season_gp_bet=season_gp_bet,
            race_points=season_gp_bet_points.race,
        ) if season_gp_bet_points.race is not None else 0.0
        return points_for_quali + points_for_race

    def __get_points_for_season_driver_for_quali(
        self,
        season_driver_id: str,
        quali_standings_by_season_driver_ids: List[str],
        season_gp_bet_points: SeasonGrandPrixBetPoints,
    ):
        if season_driver_id not in quali_standings_by_season_driver_ids:
            return 0.0

        position_index_in_quali = quali_standings_by_season_driver_ids.index(
            season_driver_id
        )
        return [
            season_gp_bet_points.quali.q3_p1,
            season_gp_bet_points.quali.q3_p2,
            season_gp_bet_points.quali.q3_p3,
            season_gp_bet_points.quali.q3_p4,
            season_gp_bet_points.quali.q3_p5,
            season_gp_bet_points.quali.q3_p6,
            season_gp_bet_points.quali.q3_p7,
            season_gp_bet_points.quali.q3_p8,
            season_gp_bet_points.quali.q3_p9,
            season_gp_bet_points.quali.q3_p10,
            season_gp_bet_points.quali.q2_p11,
            season_gp_bet_points.quali.q2_p12,
            season_gp_bet_points.quali.q2_p13,
            season_gp_bet_points.quali.q2_p14,
            season_gp_bet_points.quali.q2_p15,
            season_gp_bet_points.quali.q1_p16,
            season_gp_bet_points.quali.q1_p17,
            season_gp_bet_points.quali.q1_p18,
            season_gp_bet_points.quali.q1_p19,
            season_gp_bet_points.quali.q1_p20,
        ][position_index_in_quali]

    def __get_points_for_season_driver_for_race(
        self,
        season_driver_id: str,
        season_gp_bet: SeasonGrandPrixBet,
        race_points: RaceBetPoints,
    ):
        points_for_race = 0.0

        if season_gp_bet.p1_season_driver_id == season_driver_id:
            points_for_race = race_points.p1
        elif season_gp_bet.p2_season_driver_id == season_driver_id:
            points_for_race = race_points.p2
        elif season_gp_bet.p3_season_driver_id == season_driver_id:
            points_for_race = race_points.p3
        elif season_gp_bet.p10_season_driver_id == season_driver_id:
            points_for_race = race_points.p10

        if season_gp_bet.fastest_lap_season_driver_id == season_driver_id:
            points_for_race += race_points.fastest_lap

        dnf_drivers = season_gp_bet.dnf_season_driver_ids
        if season_driver_id in dnf_drivers:
            dnf_index = dnf_drivers.index(season_driver_id)
            if dnf_index == 0:
                points_for_race += race_points.dnf_driver1
            elif dnf_index == 1:
                points_for_race += race_points.dnf_driver2
            elif dnf_index == 2:
                points_for_race += race_points.dnf_driver3

        return points_for_race
