class GrandPrixResultsDto {
  final String id;
  final String seasonGrandPrixId;
  final List<String?>? qualiStandingsBySeasonDriverIds;
  final String? p1SeasonDriverId;
  final String? p2SeasonDriverId;
  final String? p3SeasonDriverId;
  final String? p10SeasonDriverId;
  final String? fastestLapSeasonDriverId;
  final List<String>? dnfSeasonDriverIds;
  final bool? wasThereSafetyCar;
  final bool? wasThereRedFlag;

  const GrandPrixResultsDto({
    this.id = '',
    required this.seasonGrandPrixId,
    this.qualiStandingsBySeasonDriverIds,
    this.p1SeasonDriverId,
    this.p2SeasonDriverId,
    this.p3SeasonDriverId,
    this.p10SeasonDriverId,
    this.fastestLapSeasonDriverId,
    this.dnfSeasonDriverIds,
    this.wasThereSafetyCar,
    this.wasThereRedFlag,
  });

  factory GrandPrixResultsDto.fromFirestore({
    required String id,
    required Map<String, dynamic> json,
  }) {
    return GrandPrixResultsDto(
      id: id,
      seasonGrandPrixId: json[GrandPrixResultsFields.seasonGrandPrixId],
      qualiStandingsBySeasonDriverIds:
          json[GrandPrixResultsFields.qualiStandingsBySeasonDriverIds],
      p1SeasonDriverId: json[GrandPrixResultsFields.p1SeasonDriverId],
      p2SeasonDriverId: json[GrandPrixResultsFields.p2SeasonDriverId],
      p3SeasonDriverId: json[GrandPrixResultsFields.p3SeasonDriverId],
      p10SeasonDriverId: json[GrandPrixResultsFields.p10SeasonDriverId],
      fastestLapSeasonDriverId:
          json[GrandPrixResultsFields.fastestLapSeasonDriverId],
      dnfSeasonDriverIds: json[GrandPrixResultsFields.dnfSeasonDriverIds],
      wasThereSafetyCar: json[GrandPrixResultsFields.wasThereSafetyCar],
      wasThereRedFlag: json[GrandPrixResultsFields.wasThereRedFlag],
    );
  }

  Map<String, dynamic> toFirestore() => {
        GrandPrixResultsFields.seasonGrandPrixId: seasonGrandPrixId,
        GrandPrixResultsFields.qualiStandingsBySeasonDriverIds:
            qualiStandingsBySeasonDriverIds,
        GrandPrixResultsFields.p1SeasonDriverId: p1SeasonDriverId,
        GrandPrixResultsFields.p2SeasonDriverId: p2SeasonDriverId,
        GrandPrixResultsFields.p3SeasonDriverId: p3SeasonDriverId,
        GrandPrixResultsFields.p10SeasonDriverId: p10SeasonDriverId,
        GrandPrixResultsFields.fastestLapSeasonDriverId:
            fastestLapSeasonDriverId,
        GrandPrixResultsFields.dnfSeasonDriverIds: dnfSeasonDriverIds,
        GrandPrixResultsFields.wasThereSafetyCar: wasThereSafetyCar,
        GrandPrixResultsFields.wasThereRedFlag: wasThereRedFlag,
      };
}

class GrandPrixResultsFields {
  static const seasonGrandPrixId = 'seasonGrandPrixId';
  static const qualiStandingsBySeasonDriverIds =
      'qualiStandingsBySeasonDriverIds';
  static const p1SeasonDriverId = 'p1SeasonDriverId';
  static const p2SeasonDriverId = 'p2SeasonDriverId';
  static const p3SeasonDriverId = 'p3SeasonDriverId';
  static const p10SeasonDriverId = 'p10SeasonDriverId';
  static const fastestLapSeasonDriverId = 'fastestLapSeasonDriverId';
  static const dnfSeasonDriverIds = 'dnfSeasonDriverIds';
  static const wasThereSafetyCar = 'wasThereSafetyCar';
  static const wasThereRedFlag = 'wasThereRedFlag';
}
