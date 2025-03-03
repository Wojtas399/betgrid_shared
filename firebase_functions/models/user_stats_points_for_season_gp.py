from pydantic import BaseModel


class UserStatsPointsForSeasonGp(BaseModel):
    season_grand_prix_id: str
    points: float

    @staticmethod
    def from_dict(source):
        return UserStatsPointsForSeasonGp(
            season_grand_prix_id=source['seasonGrandPrixId'],
            points=source['points'],
        )

    def to_dict(self):
        return {
            'seasonGrandPrixId': self.season_grand_prix_id,
            'points': self.points,
        }


class UserStatsPointsForSeasonGpFields:
    SEASON_GRAND_PRIX_ID = 'seasonGrandPrixId'
    POINTS = 'points'
