from google.cloud.firestore_v1.base_query import FieldFilter
from models.grand_prix_bets import GrandPrixBets
from firebase_collections_references import (
    FirebaseCollectionsReferences
)


class GrandPrixBetsDataService:
    def __init__(self):
        self.collections_references = FirebaseCollectionsReferences()

    def load_bets_for_user_and_grand_prix(
        self,
        user_id: str,
        grand_prix_id: str
    ):
        query = (
            self.collections_references.grand_prix_bets(user_id)
            .where(filter=FieldFilter("seasonGrandPrixId", "==", grand_prix_id))
            .limit(1)
        )
        doc = query.stream()[0]
        return GrandPrixBets.from_dict(doc.to_dict())
