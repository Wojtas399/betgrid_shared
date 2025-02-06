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
  }) =>
      _$QualiBetPointsDtoFromJson(json);

  Map<String, dynamic> toFirestore() => _$QualiBetPointsDtoToJson(this);
}
