import 'package:betgrid_shared/firebase/firebase_collections_references.dart';

import '../model/season_team_dto.dart';

class FirebaseSeasonTeamService {
  final FirebaseCollectionsReferences _firebaseCollectionsReferences;

  const FirebaseSeasonTeamService(this._firebaseCollectionsReferences);

  Future<Iterable<SeasonTeamDto>> fetchAllTeamsFromSeason(int season) async {
    final snapshot =
        await _firebaseCollectionsReferences.seasonTeams(season).get();
    return snapshot.docs.map((doc) => doc.data());
  }

  Future<SeasonTeamDto?> addSeasonTeam({
    required int season,
    required String teamId,
  }) async {
    final dto = SeasonTeamDto(
      season: season,
      teamId: teamId,
    );
    final docRef =
        await _firebaseCollectionsReferences.seasonTeams(season).add(dto);
    final snapshot = await docRef.get();
    return snapshot.data();
  }

  Future<void> deleteSeasonTeam({
    required int season,
    required String seasonTeamId,
  }) async {
    await _firebaseCollectionsReferences
        .seasonTeams(season)
        .doc(seasonTeamId)
        .delete();
  }
}
