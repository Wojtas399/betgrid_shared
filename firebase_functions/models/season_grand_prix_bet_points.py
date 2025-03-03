from pydantic import BaseModel
from .quali_bet_points import QualiBetPoints
from .race_bet_points import RaceBetPoints


class SeasonGrandPrixBetPoints(BaseModel):
    season_grand_prix_id: str
    total: float
    quali: QualiBetPoints | None
    race: RaceBetPoints | None

    def to_dict(self):
        return {
            SeasonGrandPrixBetPointsFields.season_grand_prix_id: self.season_grand_prix_id,
            SeasonGrandPrixBetPointsFields.total: self.total,
            SeasonGrandPrixBetPointsFields.quali: (
                self.quali.to_dict()
                if self.quali is not None
                else None
            ),
            SeasonGrandPrixBetPointsFields.race: (
                self.race.to_dict()
                if self.race is not None
                else None
            ),
        }


class SeasonGrandPrixBetPointsFields:
    season_grand_prix_id = 'seasonGrandPrixId'
    total = 'total'
    quali = 'quali'
    race = 'race'
