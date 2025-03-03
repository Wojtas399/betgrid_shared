from models import (
    SeasonGrandPrixResults,
    SeasonGrandPrixBet,
    SeasonGrandPrixBetPoints,
)
from service.data import (
    SeasonGrandPrixBetPointsDataService,
    SeasonGrandPrixBetDataService,
    UsersDataService,
)
from service.points import GpPointsService


class GrandPrixResultsTriggers:
    def __init__(self):
        self.users_data_service = UsersDataService()
        self.season_grand_prix_bet_data_service = SeasonGrandPrixBetDataService()
        self.season_grand_prix_bet_points_data_service = (
            SeasonGrandPrixBetPointsDataService()
        )

    def on_results_added(
        self,
        json_data: dict,
        season: int,
    ):
        gp_results = SeasonGrandPrixResults.from_dict(json_data)
        all_users_ids = self.users_data_service.load_ids_of_all_users()

        for user_id in all_users_ids:
            gp_bet: SeasonGrandPrixBet = (
                self
                .season_grand_prix_bet_data_service
                .load_for_user_and_season_grand_prix(
                    user_id=user_id,
                    season=season,
                    season_grand_prix_id=gp_results.season_grand_prix_id
                )
            )
            gp_points: SeasonGrandPrixBetPoints = GpPointsService(
                gp_bet=gp_bet,
                gp_results=gp_results,
            ).calculate_points()

            self.season_grand_prix_bet_points_data_service.add(
                user_id=user_id,
                season=season,
                season_grand_prix_bet_points=gp_points,
            )

    def on_results_updated(
        self,
        json_data: dict,
        season: int,
    ):
        gp_results = SeasonGrandPrixResults.from_dict(json_data)
        all_users_ids = self.users_data_service.load_ids_of_all_users()

        for user_id in all_users_ids:
            gp_bet: SeasonGrandPrixBet = (
                self
                .season_grand_prix_bet_data_service
                .load_for_user_and_season_grand_prix(
                    user_id=user_id,
                    season=season,
                    season_grand_prix_id=gp_results.season_grand_prix_id
                )
            )
            gp_points: SeasonGrandPrixBetPoints = GpPointsService(
                gp_bet=gp_bet,
                gp_results=gp_results,
            ).calculate_points()

            if self.season_grand_prix_bet_points_data_service.does_points_for_season_gp_exists(
                user_id=user_id,
                season=season,
                season_grand_prix_id=gp_results.season_grand_prix_id
            ):
                self.season_grand_prix_bet_points_data_service.update(
                    user_id=user_id,
                    season=season,
                    updated_season_grand_prix_bet_points=gp_points,
                )
            else:
                self.season_grand_prix_bet_points_data_service.add(
                    user_id=user_id,
                    season=season,
                    season_grand_prix_bet_points=gp_points,
                )
