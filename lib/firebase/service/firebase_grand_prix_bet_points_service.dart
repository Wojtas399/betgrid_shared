import '../firebase_collections_references.dart';
import '../model/grand_prix_bet_points_dto.dart';

class FirebaseGrandPrixBetPointsService {
  final _firebaseCollectionsReferences = FirebaseCollectionsReferences();

  Future<GrandPrixBetPointsDto?> fetchGrandPrixBetPoints({
    required String userId,
    required int season,
    required String seasonGrandPrixId,
  }) async {
    final snapshot = await _firebaseCollectionsReferences
        .grandPrixesBetPoints(
          userId: userId,
          season: season,
        )
        .where(
          GrandPrixBetPointsFields.seasonGrandPrixId,
          isEqualTo: seasonGrandPrixId,
        )
        .limit(1)
        .get();
    return snapshot.docs.isEmpty ? null : snapshot.docs.first.data();
  }
}
