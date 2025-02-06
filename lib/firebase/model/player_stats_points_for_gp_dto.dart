import 'package:json_annotation/json_annotation.dart';

part 'player_stats_points_for_gp_dto.g.dart';

@JsonSerializable()
class PlayerStatsPointsForGpDto {
  final String seasonGrandPrixId;
  final double points;

  const PlayerStatsPointsForGpDto({
    required this.seasonGrandPrixId,
    required this.points,
  });

  factory PlayerStatsPointsForGpDto.fromFirestore({
    required Map<String, dynamic> json,
  }) =>
      _$PlayerStatsPointsForGpDtoFromJson(json);

  Map<String, dynamic> toFirestore() => _$PlayerStatsPointsForGpDtoToJson(this);
}
