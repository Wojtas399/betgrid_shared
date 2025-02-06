import 'package:json_annotation/json_annotation.dart';

part 'season_driver_dto.g.dart';

@JsonSerializable()
class SeasonDriverDto {
  @JsonKey(includeFromJson: false, includeToJson: false)
  final String id;
  final int season;
  final String driverId;
  final int driverNumber;
  final String teamId;

  const SeasonDriverDto({
    this.id = '',
    required this.season,
    required this.driverId,
    required this.driverNumber,
    required this.teamId,
  });

  factory SeasonDriverDto.fromFirestore({
    required String id,
    required Map<String, dynamic> json,
  }) {
    final SeasonDriverDto dto = _$SeasonDriverDtoFromJson(json);
    return SeasonDriverDto(
      id: id,
      season: dto.season,
      driverId: dto.driverId,
      driverNumber: dto.driverNumber,
      teamId: dto.teamId,
    );
  }

  Map<String, dynamic> toFirestore() => _$SeasonDriverDtoToJson(this);
}
