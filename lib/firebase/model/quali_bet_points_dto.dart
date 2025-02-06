import 'package:json_annotation/json_annotation.dart';

part 'quali_bet_points_dto.g.dart';

@JsonSerializable()
class QualiBetPointsDto {
  final double totalPoints;
  final double q3P1Points;
  final double q3P2Points;
  final double q3P3Points;
  final double q3P4Points;
  final double q3P5Points;
  final double q3P6Points;
  final double q3P7Points;
  final double q3P8Points;
  final double q3P9Points;
  final double q3P10Points;
  final double q2P11Points;
  final double q2P12Points;
  final double q2P13Points;
  final double q2P14Points;
  final double q2P15Points;
  final double q1P16Points;
  final double q1P17Points;
  final double q1P18Points;
  final double q1P19Points;
  final double q1P20Points;
  final double q1Points;
  final double q2Points;
  final double q3Points;
  final double? q1Multiplier;
  final double? q2Multiplier;
  final double? q3Multiplier;
  final double? multiplier;

  const QualiBetPointsDto({
    required this.totalPoints,
    required this.q3P1Points,
    required this.q3P2Points,
    required this.q3P3Points,
    required this.q3P4Points,
    required this.q3P5Points,
    required this.q3P6Points,
    required this.q3P7Points,
    required this.q3P8Points,
    required this.q3P9Points,
    required this.q3P10Points,
    required this.q2P11Points,
    required this.q2P12Points,
    required this.q2P13Points,
    required this.q2P14Points,
    required this.q2P15Points,
    required this.q1P16Points,
    required this.q1P17Points,
    required this.q1P18Points,
    required this.q1P19Points,
    required this.q1P20Points,
    required this.q1Points,
    required this.q2Points,
    required this.q3Points,
    this.q1Multiplier,
    this.q2Multiplier,
    this.q3Multiplier,
    this.multiplier,
  });

  factory QualiBetPointsDto.fromFirestore({
    required Map<String, dynamic> json,
  }) {
    final QualiBetPointsDto dto = _$QualiBetPointsDtoFromJson(json);
    return QualiBetPointsDto(
      totalPoints: dto.totalPoints,
      q3P1Points: dto.q3P1Points,
      q3P2Points: dto.q3P2Points,
      q3P3Points: dto.q3P3Points,
      q3P4Points: dto.q3P4Points,
      q3P5Points: dto.q3P5Points,
      q3P6Points: dto.q3P6Points,
      q3P7Points: dto.q3P7Points,
      q3P8Points: dto.q3P8Points,
      q3P9Points: dto.q3P9Points,
      q3P10Points: dto.q3P10Points,
      q2P11Points: dto.q2P11Points,
      q2P12Points: dto.q2P12Points,
      q2P13Points: dto.q2P13Points,
      q2P14Points: dto.q2P14Points,
      q2P15Points: dto.q2P15Points,
      q1P16Points: dto.q1P16Points,
      q1P17Points: dto.q1P17Points,
      q1P18Points: dto.q1P18Points,
      q1P19Points: dto.q1P19Points,
      q1P20Points: dto.q1P20Points,
      q1Points: dto.q1Points,
      q2Points: dto.q2Points,
      q3Points: dto.q3Points,
      q1Multiplier: dto.q1Multiplier,
      q2Multiplier: dto.q2Multiplier,
      q3Multiplier: dto.q3Multiplier,
      multiplier: dto.multiplier,
    );
  }

  Map<String, dynamic> toFirestore() => _$QualiBetPointsDtoToJson(this);
}
