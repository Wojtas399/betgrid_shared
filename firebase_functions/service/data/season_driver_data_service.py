from typing import List
from firebase_collections_references import FirebaseCollectionsReferences


class SeasonDriverDataService:
    def __init__(self):
        self.collections_references = FirebaseCollectionsReferences()

    def load_ids_of_all_drivers_from_season(self, season: int) -> List[str]:
        docs = self.collections_references.season_drivers(season).stream()
        return [doc.id for doc in docs]
