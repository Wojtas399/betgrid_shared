from firebase_collections_references import (
    FirebaseCollectionsReferences
)
from models.user_stats import UserStats


class UserStatsDataService:
    def __init__(self):
        self.collections_references = FirebaseCollectionsReferences()

    def load_for_user_and_season(
        self,
        user_id: str,
        season: int,
    ) -> UserStats | None:
        docs = (
            self
            .collections_references
            .user_season(user_id, season)
            .limit(1)
            .stream()
        )

        for doc in docs:
            return UserStats.from_dict(doc.to_dict())

        return None

    def update_for_user_and_season(
        self,
        user_id: str,
        season: int,
        updated_user_stats: UserStats,
    ):
        (
            self
            .collections_references
            .user_season(user_id, season)
            .set(updated_user_stats.to_dict())
        )
