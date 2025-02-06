import 'package:json_annotation/json_annotation.dart';

part 'season_team_dto.g.dart';

@JsonSerializable()
class SeasonTeamDto {
  @JsonKey(includeFromJson: false, includeToJson: false)
  final String id;
  @JsonKey(includeFromJson: false, includeToJson: false)
  final int season;
  final String teamId;

  const SeasonTeamDto({
    this.id = '',
    this.season = 0,
    required this.teamId,
  });

  factory SeasonTeamDto.fromFirestore({
    required String id,
    required int season,
    required Map<String, dynamic> json,
  }) {
    final SeasonTeamDto dto = _$SeasonTeamDtoFromJson(json);
    return SeasonTeamDto(
      id: id,
      season: season,
      teamId: dto.teamId,
    );
  }

  Map<String, dynamic> toFirestore() => _$SeasonTeamDtoToJson(this);
}
