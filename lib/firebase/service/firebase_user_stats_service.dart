import '../firebase_collections_references.dart';
import '../model/user_stats_dto.dart';

class FirebaseUserStatsService {
  final _firebaseCollectionsReferences = FirebaseCollectionsReferences();

  Future<UserStatsDto?> fetchUserStatsFromSeason({
    required String userId,
    required int season,
  }) async {
    final snapshot = await _firebaseCollectionsReferences
        .userStats(
          userId: userId,
          season: season,
        )
        .get();
    return snapshot.data();
  }
}
