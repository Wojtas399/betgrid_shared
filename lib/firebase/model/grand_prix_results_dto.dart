import 'package:json_annotation/json_annotation.dart';

part 'grand_prix_results_dto.g.dart';

@JsonSerializable()
class GrandPrixResultsDto {
  @JsonKey(includeFromJson: false, includeToJson: false)
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
    final GrandPrixResultsDto dto = _$GrandPrixResultsDtoFromJson(json);
    return GrandPrixResultsDto(
      id: id,
      seasonGrandPrixId: dto.seasonGrandPrixId,
      qualiStandingsBySeasonDriverIds: dto.qualiStandingsBySeasonDriverIds,
      p1SeasonDriverId: dto.p1SeasonDriverId,
      p2SeasonDriverId: dto.p2SeasonDriverId,
      p3SeasonDriverId: dto.p3SeasonDriverId,
      p10SeasonDriverId: dto.p10SeasonDriverId,
      fastestLapSeasonDriverId: dto.fastestLapSeasonDriverId,
      dnfSeasonDriverIds: dto.dnfSeasonDriverIds,
      wasThereSafetyCar: dto.wasThereSafetyCar,
      wasThereRedFlag: dto.wasThereRedFlag,
    );
  }

  Map<String, dynamic> toFirestore() => _$GrandPrixResultsDtoToJson(this);
}
