import 'player_stats_points_for_driver_dto.dart';
import 'player_stats_points_for_gp_dto.dart';

class PlayerStatsDto {
  final String playerId;
  final int season;
  final PlayerStatsPointsForGpDto bestGpPoints;
  final PlayerStatsPointsForGpDto bestQualiPoints;
  final PlayerStatsPointsForGpDto bestRacePoints;
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
    return PlayerStatsDto(
      playerId: playerId,
      season: season,
      bestGpPoints: PlayerStatsPointsForGpDto.fromFirestore(
        json: json[PlayerStatsFields.bestGpPoints],
      ),
      bestQualiPoints: PlayerStatsPointsForGpDto.fromFirestore(
        json: json[PlayerStatsFields.bestQualiPoints],
      ),
      bestRacePoints: PlayerStatsPointsForGpDto.fromFirestore(
        json: json[PlayerStatsFields.bestRacePoints],
      ),
      pointsForDrivers: _mapPointsForDriversFromFirestore(
        json[PlayerStatsFields.pointsForDrivers],
      ),
    );
  }

  Map<String, dynamic> toFirestore() => {
        PlayerStatsFields.bestGpPoints: bestGpPoints.toFirestore(),
        PlayerStatsFields.bestQualiPoints: bestQualiPoints.toFirestore(),
        PlayerStatsFields.bestRacePoints: bestRacePoints.toFirestore(),
        PlayerStatsFields.pointsForDrivers: _mapPointsForDriversToFirestore(
          pointsForDrivers,
        ),
      };

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

class PlayerStatsFields {
  static const bestGpPoints = 'bestGpPoints';
  static const bestQualiPoints = 'bestQualiPoints';
  static const bestRacePoints = 'bestRacePoints';
  static const pointsForDrivers = 'pointsForDrivers';
}
