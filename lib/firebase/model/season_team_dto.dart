class SeasonTeamDto {
  final String id;
  final int season;
  final String teamId;

  const SeasonTeamDto({
    this.id = '',
    this.season = 0,
    required this.teamId,
  });

  factory SeasonTeamDto.fromFirestore({
    required String id,
    required int season,
    required Map<String, dynamic> json,
  }) {
    return SeasonTeamDto(
      id: id,
      season: season,
      teamId: json[SeasonTeamFields.teamId],
    );
  }

  Map<String, dynamic> toFirestore() => {
        SeasonTeamFields.teamId: teamId,
      };
}

class SeasonTeamFields {
  static const String teamId = 'teamId';
}
