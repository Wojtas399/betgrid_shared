class SeasonDriverDto {
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
    required int season,
    required Map<String, dynamic> json,
  }) {
    return SeasonDriverDto(
      id: id,
      season: season,
      driverId: json[SeasonDriverFields.driverId],
      driverNumber: json[SeasonDriverFields.driverNumber],
      teamId: json[SeasonDriverFields.teamId],
    );
  }

  Map<String, dynamic> toFirestore() => {
        SeasonDriverFields.driverId: driverId,
        SeasonDriverFields.driverNumber: driverNumber,
        SeasonDriverFields.teamId: teamId,
      };
}

class SeasonDriverFields {
  static const driverId = 'driverId';
  static const driverNumber = 'driverNumber';
  static const teamId = 'teamId';
}
