import 'package:json_annotation/json_annotation.dart';

import 'player_stats_points_for_driver_dto.dart';
import 'player_stats_points_for_gp_dto.dart';

part 'player_stats_dto.g.dart';

@JsonSerializable()
class PlayerStatsDto {
  @JsonKey(includeFromJson: false, includeToJson: false)
  final String playerId;
  @JsonKey(includeFromJson: false, includeToJson: false)
  final int season;
  @JsonKey(
    fromJson: _mapPlayerStatsPointsForGpFromFirestore,
    toJson: _mapPlayerStatsPointsForGpToFirestore,
  )
  final PlayerStatsPointsForGpDto bestGpPoints;
  @JsonKey(
    fromJson: _mapPlayerStatsPointsForGpFromFirestore,
    toJson: _mapPlayerStatsPointsForGpToFirestore,
  )
  final PlayerStatsPointsForGpDto bestQualiPoints;
  @JsonKey(
    fromJson: _mapPlayerStatsPointsForGpFromFirestore,
    toJson: _mapPlayerStatsPointsForGpToFirestore,
  )
  final PlayerStatsPointsForGpDto bestRacePoints;
  @JsonKey(
    fromJson: _mapPointsForDriversFromFirestore,
    toJson: _mapPointsForDriversToFirestore,
  )
  final List<PlayerStatsPointsForDriverDto> pointsForDrivers;

  const PlayerStatsDto({
    this.playerId = '',
    this.season = 0,
    required this.bestGpPoints,
    required this.bestQualiPoints,
    required this.bestRacePoints,
    required this.pointsForDrivers,
  });

  factory PlayerStatsDto.fromFirestore({
    required String playerId,
    required int season,
    required Map<String, dynamic> json,
  }) {
    final PlayerStatsDto dto = _$PlayerStatsDtoFromJson(json);
    return PlayerStatsDto(
      playerId: playerId,
      season: season,
      bestGpPoints: dto.bestGpPoints,
      bestQualiPoints: dto.bestQualiPoints,
      bestRacePoints: dto.bestRacePoints,
      pointsForDrivers: dto.pointsForDrivers,
    );
  }

  Map<String, dynamic> toFirestore() => _$PlayerStatsDtoToJson(this);

  static PlayerStatsPointsForGpDto _mapPlayerStatsPointsForGpFromFirestore(
    Map<String, dynamic> json,
  ) =>
      PlayerStatsPointsForGpDto.fromFirestore(json: json);

  static Map<String, dynamic> _mapPlayerStatsPointsForGpToFirestore(
    PlayerStatsPointsForGpDto dto,
  ) =>
      dto.toFirestore();

  static List<PlayerStatsPointsForDriverDto> _mapPointsForDriversFromFirestore(
    List<dynamic>? jsonsList,
  ) =>
      jsonsList != null
          ? jsonsList
              .map((e) => PlayerStatsPointsForDriverDto.fromFirestore(json: e))
              .toList()
          : [];

  static List<Map<String, dynamic>> _mapPointsForDriversToFirestore(
    List<PlayerStatsPointsForDriverDto> dtos,
  ) =>
      dtos.map((e) => e.toFirestore()).toList();
}
