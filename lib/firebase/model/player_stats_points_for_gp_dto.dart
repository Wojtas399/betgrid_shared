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
      PlayerStatsPointsForGpDto(
        seasonGrandPrixId: json[PlayerStatsPointsForGpFields.seasonGrandPrixId],
        points: json[PlayerStatsPointsForGpFields.points],
      );

  Map<String, dynamic> toFirestore() => {
        PlayerStatsPointsForGpFields.seasonGrandPrixId: seasonGrandPrixId,
        PlayerStatsPointsForGpFields.points: points,
      };
}

class PlayerStatsPointsForGpFields {
  static const seasonGrandPrixId = 'seasonGrandPrixId';
  static const points = 'points';
}
