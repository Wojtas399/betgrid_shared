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
      RaceBetPointsDto(
        totalPoints: json[RaceBetPointsFields.totalPoints],
        p1Points: json[RaceBetPointsFields.p1Points],
        p2Points: json[RaceBetPointsFields.p2Points],
        p3Points: json[RaceBetPointsFields.p3Points],
        p10Points: json[RaceBetPointsFields.p10Points],
        fastestLap: json[RaceBetPointsFields.fastestLap],
        podiumAndP: json[RaceBetPointsFields.podiumAndP],
        podiumAndP10Multip: json[RaceBetPointsFields.podiumAndP10Multip],
        dnfPoints: json[RaceBetPointsFields.dnfPoints],
        dnfDriver1: json[RaceBetPointsFields.dnfDriver1],
        dnfDriver2: json[RaceBetPointsFields.dnfDriver2],
        dnfDriver3: json[RaceBetPointsFields.dnfDriver3],
        dnfMultiplier: json[RaceBetPointsFields.dnfMultiplier],
        safetyCarP: json[RaceBetPointsFields.safetyCarP],
        redFlagPoints: json[RaceBetPointsFields.redFlagPoints],
        safetyCarAndRedFlagPoints:
            json[RaceBetPointsFields.safetyCarAndRedFlagPoints],
      );

  Map<String, dynamic> toFirestore() => {
        RaceBetPointsFields.totalPoints: totalPoints,
        RaceBetPointsFields.p1Points: p1Points,
        RaceBetPointsFields.p2Points: p2Points,
        RaceBetPointsFields.p3Points: p3Points,
        RaceBetPointsFields.p10Points: p10Points,
        RaceBetPointsFields.fastestLap: fastestLap,
        RaceBetPointsFields.podiumAndP: podiumAndP,
        RaceBetPointsFields.podiumAndP10Multip: podiumAndP10Multip,
        RaceBetPointsFields.dnfPoints: dnfPoints,
        RaceBetPointsFields.dnfDriver1: dnfDriver1,
        RaceBetPointsFields.dnfDriver2: dnfDriver2,
        RaceBetPointsFields.dnfDriver3: dnfDriver3,
        RaceBetPointsFields.dnfMultiplier: dnfMultiplier,
        RaceBetPointsFields.safetyCarP: safetyCarP,
        RaceBetPointsFields.redFlagPoints: redFlagPoints,
        RaceBetPointsFields.safetyCarAndRedFlagPoints:
            safetyCarAndRedFlagPoints,
      };
}

class RaceBetPointsFields {
  static const totalPoints = 'totalPoints';
  static const p1Points = 'p1Points';
  static const p2Points = 'p2Points';
  static const p3Points = 'p3Points';
  static const p10Points = 'p10Points';
  static const fastestLap = 'fastestLap';
  static const podiumAndP = 'podiumAndP';
  static const podiumAndP10Multip = 'podiumAndP10Multip';
  static const dnfPoints = 'dnfPoints';
  static const dnfDriver1 = 'dnfDriver1';
  static const dnfDriver2 = 'dnfDriver2';
  static const dnfDriver3 = 'dnfDriver3';
  static const dnfMultiplier = 'dnfMultiplier';
  static const safetyCarP = 'safetyCarP';
  static const redFlagPoints = 'redFlagPoints';
  static const safetyCarAndRedFlagPoints = 'safetyCarAndRedFlagPoints';
}
