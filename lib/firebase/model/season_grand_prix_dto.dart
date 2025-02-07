class SeasonGrandPrixDto {
  final String id;
  final int season;
  final String grandPrixId;
  final int roundNumber;
  final DateTime startDate;
  final DateTime endDate;

  const SeasonGrandPrixDto({
    this.id = '',
    required this.season,
    required this.grandPrixId,
    required this.roundNumber,
    required this.startDate,
    required this.endDate,
  });

  factory SeasonGrandPrixDto.fromFirestore({
    required String id,
    required int season,
    required Map<String, dynamic> json,
  }) {
    return SeasonGrandPrixDto(
      id: id,
      season: season,
      grandPrixId: json[SeasonGrandPrixFields.grandPrixId],
      roundNumber: json[SeasonGrandPrixFields.roundNumber],
      startDate: json[SeasonGrandPrixFields.startDate],
      endDate: json[SeasonGrandPrixFields.endDate],
    );
  }

  Map<String, dynamic> toFirestore() => {
        SeasonGrandPrixFields.grandPrixId: grandPrixId,
        SeasonGrandPrixFields.roundNumber: roundNumber,
        SeasonGrandPrixFields.startDate: startDate,
        SeasonGrandPrixFields.endDate: endDate,
      };
}

class SeasonGrandPrixFields {
  static const String grandPrixId = 'grandPrixId';
  static const String roundNumber = 'roundNumber';
  static const String startDate = 'startDate';
  static const String endDate = 'endDate';
}
