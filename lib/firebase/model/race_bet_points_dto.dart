import 'package:json_annotation/json_annotation.dart';

part 'race_bet_points_dto.g.dart';

@JsonSerializable()
class RaceBetPointsDto {
  final double totalPoints;
  final double p1Points;
  final double p2Points;
  final double p3Points;
  final double p10Points;
  final double fastestLap;
  final double podiumAndP;
  final double? podiumAndP10Multip;
  final double dnfPoints;
  final double dnfDriver1;
  final double dnfDriver2;
  final double dnfDriver3;
  final double? dnfMultiplier;
  final double safetyCarP;
  final double redFlagPoints;
  final double safetyCarAndRedFlagPoints;

  const RaceBetPointsDto({
    required this.totalPoints,
    required this.p1Points,
    required this.p2Points,
    required this.p3Points,
    required this.p10Points,
    required this.fastestLap,
    required this.podiumAndP,
    this.podiumAndP10Multip,
    required this.dnfPoints,
    required this.dnfDriver1,
    required this.dnfDriver2,
    required this.dnfDriver3,
    this.dnfMultiplier,
    required this.safetyCarP,
    required this.redFlagPoints,
    required this.safetyCarAndRedFlagPoints,
  });

  factory RaceBetPointsDto.fromFirestore({
    required Map<String, dynamic> json,
  }) =>
      _$RaceBetPointsDtoFromJson(json);

  Map<String, dynamic> toFirestore() => _$RaceBetPointsDtoToJson(this);
}
