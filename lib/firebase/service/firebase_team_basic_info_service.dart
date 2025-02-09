import '../firebase_collections_references.dart';
import '../model/team_basic_info_dto.dart';

class FirebaseTeamBasicInfoService {
  final _firebaseCollectionsReferences = FirebaseCollectionsReferences();

  Future<Iterable<TeamBasicInfoDto>> fetchAllTeamsBasicInfo() async {
    final snapshot =
        await _firebaseCollectionsReferences.teamsBasicInfo().get();
    return snapshot.docs.map((doc) => doc.data());
  }

  Future<TeamBasicInfoDto?> fetchTeamBasicInfoById(String id) async {
    final snapshot =
        await _firebaseCollectionsReferences.teamsBasicInfo().doc(id).get();
    return snapshot.data();
  }

  Future<TeamBasicInfoDto?> addTeamBasicInfo({
    required String name,
    required String hexColor,
  }) async {
    final dto = TeamBasicInfoDto(
      name: name,
      hexColor: hexColor,
    );
    final docRef =
        await _firebaseCollectionsReferences.teamsBasicInfo().add(dto);
    final snapshot = await docRef.get();
    return snapshot.data();
  }

  Future<void> deleteTeamBasicInfo(String id) async {
    await _firebaseCollectionsReferences.teamsBasicInfo().doc(id).delete();
  }
}
