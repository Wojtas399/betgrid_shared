from typing import Optional
from pydantic import BaseModel
from .quali_bet_points import QualiBetPoints
from .race_bet_points import RaceBetPoints


class SeasonGrandPrixBetPoints(BaseModel):
    season_grand_prix_id: str
    total_points: float
    quali_bet_points: Optional[QualiBetPoints]
    race_bet_points: Optional[RaceBetPoints]

    def to_dict(self):
        return {
            SeasonGrandPrixBetPointsFields.season_grand_prix_id: self.season_grand_prix_id,
            SeasonGrandPrixBetPointsFields.total_points: self.total_points,
            SeasonGrandPrixBetPointsFields.quali_bet_points: (
                self.quali_bet_points.to_dict()
                if self.quali_bet_points is not None
                else None
            ),
            SeasonGrandPrixBetPointsFields.race_bet_points: (
                self.race_bet_points.to_dict()
                if self.race_bet_points is not None
                else None
            ),
        }


class SeasonGrandPrixBetPointsFields:
    season_grand_prix_id = 'seasonGrandPrixId'
    total_points = 'totalPoints'
    quali_bet_points = 'qualiBetPoints'
    race_bet_points = 'raceBetPoints'
