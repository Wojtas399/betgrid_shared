import 'quali_bet_points_dto.dart';
import 'race_bet_points_dto.dart';

class GrandPrixBetPointsDto {
  final String id;
  final String playerId;
  final int season;
  final String seasonGrandPrixId;
  final double totalPoints;
  final QualiBetPointsDto? qualiBetPointsDto;
  final RaceBetPointsDto? raceBetPointsDto;

  const GrandPrixBetPointsDto({
    this.id = '',
    this.playerId = '',
    this.season = 0,
    required this.seasonGrandPrixId,
    required this.totalPoints,
    this.qualiBetPointsDto,
    this.raceBetPointsDto,
  });

  factory GrandPrixBetPointsDto.fromFirestore({
    required String id,
    required String playerId,
    required int season,
    required Map<String, dynamic> json,
  }) {
    return GrandPrixBetPointsDto(
      id: id,
      playerId: playerId,
      season: season,
      seasonGrandPrixId: json[GrandPrixBetPointsFields.seasonGrandPrixId],
      totalPoints: json[GrandPrixBetPointsFields.totalPoints],
      qualiBetPointsDto: _mapQualiBetPointsFromFirestore(
        json[GrandPrixBetPointsFields.qualiBetPoints],
      ),
      raceBetPointsDto: _mapRaceBetPointsFromFirestore(
        json[GrandPrixBetPointsFields.raceBetPoints],
      ),
    );
  }

  Map<String, Object?> toFirestore() => {
        GrandPrixBetPointsFields.seasonGrandPrixId: seasonGrandPrixId,
        GrandPrixBetPointsFields.totalPoints: totalPoints,
        GrandPrixBetPointsFields.qualiBetPoints:
            qualiBetPointsDto?.toFirestore(),
        GrandPrixBetPointsFields.raceBetPoints: raceBetPointsDto?.toFirestore(),
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

class GrandPrixBetPointsFields {
  static const seasonGrandPrixId = 'seasonGrandPrixId';
  static const totalPoints = 'totalPoints';
  static const qualiBetPoints = 'qualiBetPoints';
  static const raceBetPoints = 'raceBetPoints';
}
