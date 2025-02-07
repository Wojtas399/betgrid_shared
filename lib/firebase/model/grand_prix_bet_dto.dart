class GrandPrixBetDto {
  final String id;
  final String playerId;
  final String seasonGrandPrixId;
  final List<String?> qualiStandingsBySeasonDriverIds;
  final String? p1SeasonDriverId;
  final String? p2SeasonDriverId;
  final String? p3SeasonDriverId;
  final String? p10SeasonDriverId;
  final String? fastestLapSeasonDriverId;
  final List<String> dnfSeasonDriverIds;
  final bool? willBeSafetyCar;
  final bool? willBeRedFlag;

  const GrandPrixBetDto({
    this.id = '',
    this.playerId = '',
    required this.seasonGrandPrixId,
    required this.qualiStandingsBySeasonDriverIds,
    this.p1SeasonDriverId,
    this.p2SeasonDriverId,
    this.p3SeasonDriverId,
    this.p10SeasonDriverId,
    this.fastestLapSeasonDriverId,
    required this.dnfSeasonDriverIds,
    this.willBeSafetyCar,
    this.willBeRedFlag,
  });

  factory GrandPrixBetDto.fromFirestore({
    required String id,
    required String playerId,
    required Map<String, dynamic> json,
  }) {
    return GrandPrixBetDto(
      id: id,
      playerId: playerId,
      seasonGrandPrixId: json[GrandPrixBetFields.seasonGrandPrixId],
      qualiStandingsBySeasonDriverIds:
          json[GrandPrixBetFields.qualiStandingsBySeasonDriverIds],
      p1SeasonDriverId: json[GrandPrixBetFields.p1SeasonDriverId],
      p2SeasonDriverId: json[GrandPrixBetFields.p2SeasonDriverId],
      p3SeasonDriverId: json[GrandPrixBetFields.p3SeasonDriverId],
      p10SeasonDriverId: json[GrandPrixBetFields.p10SeasonDriverId],
      fastestLapSeasonDriverId:
          json[GrandPrixBetFields.fastestLapSeasonDriverId],
      dnfSeasonDriverIds: json[GrandPrixBetFields.dnfSeasonDriverIds],
      willBeSafetyCar: json[GrandPrixBetFields.willBeSafetyCar],
      willBeRedFlag: json[GrandPrixBetFields.willBeRedFlag],
    );
  }

  Map<String, dynamic> toFirestore() => {
        GrandPrixBetFields.seasonGrandPrixId: seasonGrandPrixId,
        GrandPrixBetFields.qualiStandingsBySeasonDriverIds:
            qualiStandingsBySeasonDriverIds,
        GrandPrixBetFields.p1SeasonDriverId: p1SeasonDriverId,
        GrandPrixBetFields.p2SeasonDriverId: p2SeasonDriverId,
        GrandPrixBetFields.p3SeasonDriverId: p3SeasonDriverId,
        GrandPrixBetFields.p10SeasonDriverId: p10SeasonDriverId,
        GrandPrixBetFields.fastestLapSeasonDriverId: fastestLapSeasonDriverId,
        GrandPrixBetFields.dnfSeasonDriverIds: dnfSeasonDriverIds,
        GrandPrixBetFields.willBeSafetyCar: willBeSafetyCar,
        GrandPrixBetFields.willBeRedFlag: willBeRedFlag,
      };
}

class GrandPrixBetFields {
  static const seasonGrandPrixId = 'seasonGrandPrixId';
  static const qualiStandingsBySeasonDriverIds =
      'qualiStandingsBySeasonDriverIds';
  static const p1SeasonDriverId = 'p1SeasonDriverId';
  static const p2SeasonDriverId = 'p2SeasonDriverId';
  static const p3SeasonDriverId = 'p3SeasonDriverId';
  static const p10SeasonDriverId = 'p10SeasonDriverId';
  static const fastestLapSeasonDriverId = 'fastestLapSeasonDriverId';
  static const dnfSeasonDriverIds = 'dnfSeasonDriverIds';
  static const willBeSafetyCar = 'willBeSafetyCar';
  static const willBeRedFlag = 'willBeRedFlag';
}
