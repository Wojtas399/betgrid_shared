import 'package:json_annotation/json_annotation.dart';

part 'player_stats_points_for_driver_dto.g.dart';

@JsonSerializable()
class PlayerStatsPointsForDriverDto {
  final String seasonDriverId;
  final double points;

  const PlayerStatsPointsForDriverDto({
    required this.seasonDriverId,
    required this.points,
  });

  factory PlayerStatsPointsForDriverDto.fromFirestore({
    required Map<String, dynamic> json,
  }) =>
      _$PlayerStatsPointsForDriverDtoFromJson(json);

  Map<String, dynamic> toFirestore() =>
      _$PlayerStatsPointsForDriverDtoToJson(this);
}
