import 'package:betgrid_shared/firebase/firebase_collections_references.dart';

import '../model/season_driver_dto.dart';

class FirebaseSeasonDriverService {
  final FirebaseCollectionsReferences _firebaseCollectionsReferences;

  const FirebaseSeasonDriverService(this._firebaseCollectionsReferences);

  Future<Iterable<SeasonDriverDto>> fetchAllDriversFromSeason(
    int season,
  ) async {
    final snapshot =
        await _firebaseCollectionsReferences.seasonDrivers(season).get();
    return snapshot.docs.map((doc) => doc.data()).toList();
  }

  Future<SeasonDriverDto?> addSeasonDriver({
    required int season,
    required String driverId,
    required int driverNumber,
    required String teamId,
  }) async {
    final dto = SeasonDriverDto(
      season: season,
      driverId: driverId,
      driverNumber: driverNumber,
      teamId: teamId,
    );
    final docRef =
        await _firebaseCollectionsReferences.seasonDrivers(season).add(dto);
    final snapshot = await docRef.get();
    return snapshot.data();
  }

  Future<void> deleteSeasonDriver({
    required int season,
    required String seasonDriverId,
  }) async {
    await _firebaseCollectionsReferences
        .seasonDrivers(season)
        .doc(seasonDriverId)
        .delete();
  }
}
