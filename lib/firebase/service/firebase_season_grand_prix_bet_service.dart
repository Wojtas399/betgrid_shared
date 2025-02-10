import '../firebase_collections_references.dart';
import '../model/season_grand_prix_bet_dto.dart';

class FirebaseSeasonGrandPrixBetService {
  final _firebaseCollectionsReferences = FirebaseCollectionsReferences();

  Future<SeasonGrandPrixBetDto?> fetchBySeasonGrandPrixId({
    required String userId,
    required int season,
    required String seasonGrandPrixId,
  }) async {
    final snapshot = await _firebaseCollectionsReferences
        .seasonGrandPrixesBets(
          userId: userId,
          season: season,
        )
        .where(
          GrandPrixBetFields.seasonGrandPrixId,
          isEqualTo: seasonGrandPrixId,
        )
        .get();
    if (snapshot.docs.isEmpty) return null;
    return snapshot.docs.first.data();
  }

  Future<SeasonGrandPrixBetDto?> add({
    required String userId,
    required int season,
    required String seasonGrandPrixId,
    List<String?> qualiStandingsBySeasonDriverIds = const [],
    String? p1SeasonDriverId,
    String? p2SeasonDriverId,
    String? p3SeasonDriverId,
    String? p10SeasonDriverId,
    String? fastestLapSeasonDriverId,
    List<String> dnfSeasonDriverIds = const [],
    bool? willBeSafetyCar,
    bool? willBeRedFlag,
  }) async {
    final seasonGrandPrixBetDto = SeasonGrandPrixBetDto(
      seasonGrandPrixId: seasonGrandPrixId,
      qualiStandingsBySeasonDriverIds: qualiStandingsBySeasonDriverIds,
      p1SeasonDriverId: p1SeasonDriverId,
      p2SeasonDriverId: p2SeasonDriverId,
      p3SeasonDriverId: p3SeasonDriverId,
      p10SeasonDriverId: p10SeasonDriverId,
      fastestLapSeasonDriverId: fastestLapSeasonDriverId,
      dnfSeasonDriverIds: dnfSeasonDriverIds,
      willBeSafetyCar: willBeSafetyCar,
      willBeRedFlag: willBeRedFlag,
    );
    final docRef = await _firebaseCollectionsReferences
        .seasonGrandPrixesBets(
          userId: userId,
          season: season,
        )
        .add(seasonGrandPrixBetDto);
    final snapshot = await docRef.get();
    return snapshot.data();
  }

  Future<SeasonGrandPrixBetDto?> update({
    required String userId,
    required int season,
    required String seasonGrandPrixId,
    List<String?>? qualiStandingsBySeasonDriverIds,
    String? p1SeasonDriverId,
    String? p2SeasonDriverId,
    String? p3SeasonDriverId,
    String? p10SeasonDriverId,
    String? fastestLapSeasonDriverId,
    List<String>? dnfSeasonDriverIds,
    bool? willBeSafetyCar,
    bool? willBeRedFlag,
  }) async {
    final docRef = _firebaseCollectionsReferences
        .seasonGrandPrixesBets(
          userId: userId,
          season: season,
        )
        .doc(seasonGrandPrixId);
    await docRef.update({
      if (qualiStandingsBySeasonDriverIds != null)
        GrandPrixBetFields.qualiStandingsBySeasonDriverIds:
            qualiStandingsBySeasonDriverIds,
      if (dnfSeasonDriverIds != null)
        GrandPrixBetFields.dnfSeasonDriverIds: dnfSeasonDriverIds,
      GrandPrixBetFields.p1SeasonDriverId: p1SeasonDriverId,
      GrandPrixBetFields.p2SeasonDriverId: p2SeasonDriverId,
      GrandPrixBetFields.p3SeasonDriverId: p3SeasonDriverId,
      GrandPrixBetFields.p10SeasonDriverId: p10SeasonDriverId,
      GrandPrixBetFields.fastestLapSeasonDriverId: fastestLapSeasonDriverId,
      GrandPrixBetFields.willBeSafetyCar: willBeSafetyCar,
      GrandPrixBetFields.willBeRedFlag: willBeRedFlag,
    });
    final snapshot = await docRef.get();
    return snapshot.data();
  }
}
