import '../firebase_collections_references.dart';
import '../model/season_grand_prix_results_dto.dart';

class FirebaseSeasonGrandPrixResultsService {
  final _firebaseCollectionReferences = FirebaseCollectionsReferences();

  Future<SeasonGrandPrixResultsDto?> fetchResultsForSeasonGrandPrix({
    required int season,
    required String seasonGrandPrixId,
  }) async {
    final snapshot = await _firebaseCollectionReferences
        .seasonGrandPrixesResults(season)
        .where(
          SeasonGrandPrixResultsFields.seasonGrandPrixId,
          isEqualTo: seasonGrandPrixId,
        )
        .limit(1)
        .get();
    return snapshot.docs.isEmpty ? null : snapshot.docs.first.data();
  }
}
