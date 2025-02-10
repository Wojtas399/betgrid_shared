import 'quali_bet_points_dto.dart';
import 'race_bet_points_dto.dart';

class SeasonGrandPrixBetPointsDto {
  final String id;
  final String userId;
  final int season;
  final String seasonGrandPrixId;
  final double totalPoints;
  final QualiBetPointsDto? qualiBetPointsDto;
  final RaceBetPointsDto? raceBetPointsDto;

  const SeasonGrandPrixBetPointsDto({
    this.id = '',
    this.userId = '',
    this.season = 0,
    required this.seasonGrandPrixId,
    required this.totalPoints,
    this.qualiBetPointsDto,
    this.raceBetPointsDto,
  });

  factory SeasonGrandPrixBetPointsDto.fromFirestore({
    required String id,
    required String userId,
    required int season,
    required Map<String, dynamic> json,
  }) {
    return SeasonGrandPrixBetPointsDto(
      id: id,
      userId: userId,
      season: season,
      seasonGrandPrixId: json[SeasonGrandPrixBetPointsFields.seasonGrandPrixId],
      totalPoints: json[SeasonGrandPrixBetPointsFields.totalPoints],
      qualiBetPointsDto: _mapQualiBetPointsFromFirestore(
        json[SeasonGrandPrixBetPointsFields.qualiBetPoints],
      ),
      raceBetPointsDto: _mapRaceBetPointsFromFirestore(
        json[SeasonGrandPrixBetPointsFields.raceBetPoints],
      ),
    );
  }

  Map<String, Object?> toFirestore() => {
        SeasonGrandPrixBetPointsFields.seasonGrandPrixId: seasonGrandPrixId,
        SeasonGrandPrixBetPointsFields.totalPoints: totalPoints,
        SeasonGrandPrixBetPointsFields.qualiBetPoints:
            qualiBetPointsDto?.toFirestore(),
        SeasonGrandPrixBetPointsFields.raceBetPoints:
            raceBetPointsDto?.toFirestore(),
      };

  static QualiBetPointsDto? _mapQualiBetPointsFromFirestore(
    Map<String, dynamic>? json,
  ) =>
      json != null ? QualiBetPointsDto.fromFirestore(json: json) : null;

  static RaceBetPointsDto? _mapRaceBetPointsFromFirestore(
    Map<String, dynamic>? json,
  ) =>
      json != null ? RaceBetPointsDto.fromFirestore(json: json) : null;
}

class SeasonGrandPrixBetPointsFields {
  static const seasonGrandPrixId = 'seasonGrandPrixId';
  static const totalPoints = 'totalPoints';
  static const qualiBetPoints = 'qualiBetPoints';
  static const raceBetPoints = 'raceBetPoints';
}
