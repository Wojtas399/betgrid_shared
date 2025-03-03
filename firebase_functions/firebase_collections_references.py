from firebase_admin import firestore
from firebase_collections import FirebaseCollections


class FirebaseCollectionsReferences:
    def __init__(self):
        self.db = firestore.client()

    def users(self):
        return self.db.collection(FirebaseCollections.USERS.MAIN)

    def season_drivers(self, season: int):
        return (
            self
            .db
            .collection(FirebaseCollections.SEASON.MAIN)
            .document(str(season))
            .collection(FirebaseCollections.SEASON.DRIVERS)
        )

    def user_season(self, user_id: str, season: int):
        return (
            self
            .db
            .collection(FirebaseCollections.USERS.MAIN)
            .document(user_id)
            .collection(FirebaseCollections.USERS.SEASON.MAIN)
            .document(str(season))
        )

    def user_season_grand_prix_bets(self, user_id: str, season: int):
        return (
            self
            .user_season(user_id, season)
            .collection(FirebaseCollections.USERS.SEASON.GRAND_PRIX_BETS)
        )

    def user_season_grand_prix_bet_points(self, user_id: str, season: int):
        return (
            self
            .user_season(user_id, season)
            .collection(FirebaseCollections.USERS.SEASON.GRAND_PRIX_BETS_POINTS)
        )
