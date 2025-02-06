import 'package:json_annotation/json_annotation.dart';

part 'season_grand_prix_dto.g.dart';

@JsonSerializable()
class SeasonGrandPrixDto {
  @JsonKey(includeFromJson: false, includeToJson: false)
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
    required Map<String, dynamic> json,
  }) {
    final SeasonGrandPrixDto dto = _$SeasonGrandPrixDtoFromJson(json);
    return SeasonGrandPrixDto(
      id: id,
      season: dto.season,
      grandPrixId: dto.grandPrixId,
      roundNumber: dto.roundNumber,
      startDate: dto.startDate,
      endDate: dto.endDate,
    );
  }

  Map<String, dynamic> toFirestore() => _$SeasonGrandPrixDtoToJson(this);
}
