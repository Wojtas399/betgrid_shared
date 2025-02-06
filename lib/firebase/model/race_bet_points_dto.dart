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
  }) {
    final RaceBetPointsDto dto = _$RaceBetPointsDtoFromJson(json);
    return RaceBetPointsDto(
      totalPoints: dto.totalPoints,
      p1Points: dto.p1Points,
      p2Points: dto.p2Points,
      p3Points: dto.p3Points,
      p10Points: dto.p10Points,
      fastestLap: dto.fastestLap,
      podiumAndP: dto.podiumAndP,
      podiumAndP10Multip: dto.podiumAndP10Multip,
      dnfPoints: dto.dnfPoints,
      dnfDriver1: dto.dnfDriver1,
      dnfDriver2: dto.dnfDriver2,
      dnfDriver3: dto.dnfDriver3,
      dnfMultiplier: dto.dnfMultiplier,
      safetyCarP: dto.safetyCarP,
      redFlagPoints: dto.redFlagPoints,
      safetyCarAndRedFlagPoints: dto.safetyCarAndRedFlagPoints,
    );
  }

  Map<String, dynamic> toFirestore() => _$RaceBetPointsDtoToJson(this);
}
