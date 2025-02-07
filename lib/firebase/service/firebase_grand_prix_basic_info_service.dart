import '../firebase_collections_references.dart';
import '../model/grand_prix_basic_info_dto.dart';

class FirebaseGrandPrixBasicInfoService {
  final _firebaseCollectionsReferences = FirebaseCollectionsReferences();

  Future<Iterable<GrandPrixBasicInfoDto>> fetchAllGrandPrixesBasicInfo() async {
    final snapshot =
        await _firebaseCollectionsReferences.grandPrixesBasicInfo().get();
    return snapshot.docs.map((doc) => doc.data()).toList();
  }

  Future<GrandPrixBasicInfoDto?> addGrandPrixBasicInfo({
    required String name,
    required String countryAlpha2Code,
  }) async {
    final dto = GrandPrixBasicInfoDto(
      name: name,
      countryAlpha2Code: countryAlpha2Code,
    );
    final docRef =
        await _firebaseCollectionsReferences.grandPrixesBasicInfo().add(dto);
    final snapshot = await docRef.get();
    return snapshot.data();
  }

  Future<void> deleteGrandPrixBasicInfo({
    required String grandPrixBasicInfoId,
  }) async {
    await _firebaseCollectionsReferences
        .grandPrixesBasicInfo()
        .doc(grandPrixBasicInfoId)
        .delete();
  }
}
