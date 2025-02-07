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
      QualiBetPointsDto(
        totalPoints: json[QualiBetPointsFields.totalPoints],
        q3P1Points: json[QualiBetPointsFields.q3P1Points],
        q3P2Points: json[QualiBetPointsFields.q3P2Points],
        q3P3Points: json[QualiBetPointsFields.q3P3Points],
        q3P4Points: json[QualiBetPointsFields.q3P4Points],
        q3P5Points: json[QualiBetPointsFields.q3P5Points],
        q3P6Points: json[QualiBetPointsFields.q3P6Points],
        q3P7Points: json[QualiBetPointsFields.q3P7Points],
        q3P8Points: json[QualiBetPointsFields.q3P8Points],
        q3P9Points: json[QualiBetPointsFields.q3P9Points],
        q3P10Points: json[QualiBetPointsFields.q3P10Points],
        q2P11Points: json[QualiBetPointsFields.q2P11Points],
        q2P12Points: json[QualiBetPointsFields.q2P12Points],
        q2P13Points: json[QualiBetPointsFields.q2P13Points],
        q2P14Points: json[QualiBetPointsFields.q2P14Points],
        q2P15Points: json[QualiBetPointsFields.q2P15Points],
        q1P16Points: json[QualiBetPointsFields.q1P16Points],
        q1P17Points: json[QualiBetPointsFields.q1P17Points],
        q1P18Points: json[QualiBetPointsFields.q1P18Points],
        q1P19Points: json[QualiBetPointsFields.q1P19Points],
        q1P20Points: json[QualiBetPointsFields.q1P20Points],
        q1Points: json[QualiBetPointsFields.q1Points],
        q2Points: json[QualiBetPointsFields.q2Points],
        q3Points: json[QualiBetPointsFields.q3Points],
        q1Multiplier: json[QualiBetPointsFields.q1Multiplier],
        q2Multiplier: json[QualiBetPointsFields.q2Multiplier],
        q3Multiplier: json[QualiBetPointsFields.q3Multiplier],
        multiplier: json[QualiBetPointsFields.multiplier],
      );

  Map<String, dynamic> toFirestore() => {
        QualiBetPointsFields.totalPoints: totalPoints,
        QualiBetPointsFields.q3P1Points: q3P1Points,
        QualiBetPointsFields.q3P2Points: q3P2Points,
        QualiBetPointsFields.q3P3Points: q3P3Points,
        QualiBetPointsFields.q3P4Points: q3P4Points,
        QualiBetPointsFields.q3P5Points: q3P5Points,
        QualiBetPointsFields.q3P6Points: q3P6Points,
        QualiBetPointsFields.q3P7Points: q3P7Points,
        QualiBetPointsFields.q3P8Points: q3P8Points,
        QualiBetPointsFields.q3P9Points: q3P9Points,
        QualiBetPointsFields.q3P10Points: q3P10Points,
        QualiBetPointsFields.q2P11Points: q2P11Points,
        QualiBetPointsFields.q2P12Points: q2P12Points,
        QualiBetPointsFields.q2P13Points: q2P13Points,
        QualiBetPointsFields.q2P14Points: q2P14Points,
        QualiBetPointsFields.q2P15Points: q2P15Points,
        QualiBetPointsFields.q1P16Points: q1P16Points,
        QualiBetPointsFields.q1P17Points: q1P17Points,
        QualiBetPointsFields.q1P18Points: q1P18Points,
        QualiBetPointsFields.q1P19Points: q1P19Points,
        QualiBetPointsFields.q1P20Points: q1P20Points,
        QualiBetPointsFields.q1Points: q1Points,
        QualiBetPointsFields.q2Points: q2Points,
        QualiBetPointsFields.q3Points: q3Points,
        QualiBetPointsFields.q1Multiplier: q1Multiplier,
        QualiBetPointsFields.q2Multiplier: q2Multiplier,
        QualiBetPointsFields.q3Multiplier: q3Multiplier,
        QualiBetPointsFields.multiplier: multiplier,
      };
}

class QualiBetPointsFields {
  static const totalPoints = 'totalPoints';
  static const q3P1Points = 'q3P1Points';
  static const q3P2Points = 'q3P2Points';
  static const q3P3Points = 'q3P3Points';
  static const q3P4Points = 'q3P4Points';
  static const q3P5Points = 'q3P5Points';
  static const q3P6Points = 'q3P6Points';
  static const q3P7Points = 'q3P7Points';
  static const q3P8Points = 'q3P8Points';
  static const q3P9Points = 'q3P9Points';
  static const q3P10Points = 'q3P10Points';
  static const q2P11Points = 'q2P11Points';
  static const q2P12Points = 'q2P12Points';
  static const q2P13Points = 'q2P13Points';
  static const q2P14Points = 'q2P14Points';
  static const q2P15Points = 'q2P15Points';
  static const q1P16Points = 'q1P16Points';
  static const q1P17Points = 'q1P17Points';
  static const q1P18Points = 'q1P18Points';
  static const q1P19Points = 'q1P19Points';
  static const q1P20Points = 'q1P20Points';
  static const q1Points = 'q1Points';
  static const q2Points = 'q2Points';
  static const q3Points = 'q3Points';
  static const q1Multiplier = 'q1Multiplier';
  static const q2Multiplier = 'q2Multiplier';
  static const q3Multiplier = 'q3Multiplier';
  static const multiplier = 'multiplier';
}
