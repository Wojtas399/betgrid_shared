import 'package:json_annotation/json_annotation.dart';

part 'grand_prix_bet_dto.g.dart';

@JsonSerializable()
class GrandPrixBetDto {
  @JsonKey(includeFromJson: false, includeToJson: false)
  final String id;
  @JsonKey(includeFromJson: false, includeToJson: false)
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
    final GrandPrixBetDto dto = _$GrandPrixBetDtoFromJson(json);
    return GrandPrixBetDto(
      id: id,
      playerId: playerId,
      seasonGrandPrixId: dto.seasonGrandPrixId,
      qualiStandingsBySeasonDriverIds: dto.qualiStandingsBySeasonDriverIds,
      p1SeasonDriverId: dto.p1SeasonDriverId,
      p2SeasonDriverId: dto.p2SeasonDriverId,
      p3SeasonDriverId: dto.p3SeasonDriverId,
      p10SeasonDriverId: dto.p10SeasonDriverId,
      fastestLapSeasonDriverId: dto.fastestLapSeasonDriverId,
      dnfSeasonDriverIds: dto.dnfSeasonDriverIds,
      willBeSafetyCar: dto.willBeSafetyCar,
      willBeRedFlag: dto.willBeRedFlag,
    );
  }

  Map<String, dynamic> toFirestore() => _$GrandPrixBetDtoToJson(this);
}
