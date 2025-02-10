import 'user_stats_points_for_driver_dto.dart';
import 'user_stats_points_for_gp_dto.dart';

class UserStatsDto {
  final String userId;
  final int season;
  final UserStatsPointsForGpDto bestGpPoints;
  final UserStatsPointsForGpDto bestQualiPoints;
  final UserStatsPointsForGpDto bestRacePoints;
  final List<UserStatsPointsForDriverDto> pointsForDrivers;

  const UserStatsDto({
    this.userId = '',
    this.season = 0,
    required this.bestGpPoints,
    required this.bestQualiPoints,
    required this.bestRacePoints,
    required this.pointsForDrivers,
  });

  factory UserStatsDto.fromFirestore({
    required String userId,
    required int season,
    required Map<String, dynamic> json,
  }) {
    return UserStatsDto(
      userId: userId,
      season: season,
      bestGpPoints: UserStatsPointsForGpDto.fromFirestore(
        json: json[UserStatsFields.bestGpPoints],
      ),
      bestQualiPoints: UserStatsPointsForGpDto.fromFirestore(
        json: json[UserStatsFields.bestQualiPoints],
      ),
      bestRacePoints: UserStatsPointsForGpDto.fromFirestore(
        json: json[UserStatsFields.bestRacePoints],
      ),
      pointsForDrivers: _mapPointsForDriversFromFirestore(
        json[UserStatsFields.pointsForDrivers],
      ),
    );
  }

  Map<String, dynamic> toFirestore() => {
        UserStatsFields.bestGpPoints: bestGpPoints.toFirestore(),
        UserStatsFields.bestQualiPoints: bestQualiPoints.toFirestore(),
        UserStatsFields.bestRacePoints: bestRacePoints.toFirestore(),
        UserStatsFields.pointsForDrivers: _mapPointsForDriversToFirestore(
          pointsForDrivers,
        ),
      };

  static List<UserStatsPointsForDriverDto> _mapPointsForDriversFromFirestore(
    List<dynamic>? jsonsList,
  ) =>
      jsonsList != null
          ? jsonsList
              .map((e) => UserStatsPointsForDriverDto.fromFirestore(json: e))
              .toList()
          : [];

  static List<Map<String, dynamic>> _mapPointsForDriversToFirestore(
    List<UserStatsPointsForDriverDto> dtos,
  ) =>
      dtos.map((e) => e.toFirestore()).toList();
}

class UserStatsFields {
  static const bestGpPoints = 'bestGpPoints';
  static const bestQualiPoints = 'bestQualiPoints';
  static const bestRacePoints = 'bestRacePoints';
  static const pointsForDrivers = 'pointsForDrivers';
}
