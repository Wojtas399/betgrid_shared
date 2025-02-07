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
      PlayerStatsPointsForDriverDto(
        seasonDriverId: json[PlayerStatsPointsForDriverFields.seasonDriverId],
        points: json[PlayerStatsPointsForDriverFields.points],
      );

  Map<String, dynamic> toFirestore() => {
        PlayerStatsPointsForDriverFields.seasonDriverId: seasonDriverId,
        PlayerStatsPointsForDriverFields.points: points,
      };
}

class PlayerStatsPointsForDriverFields {
  static const seasonDriverId = 'seasonDriverId';
  static const points = 'points';
}
