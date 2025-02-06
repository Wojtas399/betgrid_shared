import 'package:betgrid_shared/firebase/model/quali_bet_points_dto.dart';
import 'package:betgrid_shared/firebase/model/race_bet_points_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'grand_prix_bet_points_dto.g.dart';

@JsonSerializable()
class GrandPrixBetPointsDto {
  @JsonKey(includeFromJson: false, includeToJson: false)
  final String id;
  @JsonKey(includeFromJson: false, includeToJson: false)
  final String playerId;
  final String seasonGrandPrixId;
  final double totalPoints;
  @JsonKey(
    name: 'qualiBetPoints',
    fromJson: _mapQualiBetPointsFromFirestore,
    toJson: _mapQualiBetPointsToFirestore,
  )
  final QualiBetPointsDto? qualiBetPointsDto;
  @JsonKey(
    name: 'raceBetPoints',
    fromJson: _mapRaceBetPointsFromFirestore,
    toJson: _mapRaceBetPointsToFirestore,
  )
  final RaceBetPointsDto? raceBetPointsDto;

  const GrandPrixBetPointsDto({
    this.id = '',
    this.playerId = '',
    required this.seasonGrandPrixId,
    required this.totalPoints,
    this.qualiBetPointsDto,
    this.raceBetPointsDto,
  });

  factory GrandPrixBetPointsDto.fromFirestore({
    required String id,
    required String playerId,
    required Map<String, dynamic> json,
  }) {
    final GrandPrixBetPointsDto dto = _$GrandPrixBetPointsDtoFromJson(json);
    return GrandPrixBetPointsDto(
      id: id,
      playerId: playerId,
      seasonGrandPrixId: dto.seasonGrandPrixId,
      totalPoints: dto.totalPoints,
      qualiBetPointsDto: dto.qualiBetPointsDto,
      raceBetPointsDto: dto.raceBetPointsDto,
    );
  }

  Map<String, Object?> toFirestore() => _$GrandPrixBetPointsDtoToJson(this);

  static QualiBetPointsDto? _mapQualiBetPointsFromFirestore(
    Map<String, dynamic>? json,
  ) =>
      json != null ? QualiBetPointsDto.fromFirestore(json: json) : null;

  static Map<String, Object?>? _mapQualiBetPointsToFirestore(
    QualiBetPointsDto? dto,
  ) =>
      dto?.toFirestore();

  static RaceBetPointsDto? _mapRaceBetPointsFromFirestore(
    Map<String, dynamic>? json,
  ) =>
      json != null ? RaceBetPointsDto.fromFirestore(json: json) : null;

  static Map<String, Object?>? _mapRaceBetPointsToFirestore(
    RaceBetPointsDto? dto,
  ) =>
      dto?.toFirestore();
}
