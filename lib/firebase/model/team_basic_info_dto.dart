import 'package:json_annotation/json_annotation.dart';

part 'team_basic_info_dto.g.dart';

@JsonSerializable()
class TeamBasicInfoDto {
  @JsonKey(includeToJson: false, includeFromJson: false)
  final String id;
  final String name;
  final String hexColor;

  const TeamBasicInfoDto({
    this.id = '',
    required this.name,
    required this.hexColor,
  });

  factory TeamBasicInfoDto.fromFirestore({
    required String id,
    required Map<String, dynamic> json,
  }) {
    final TeamBasicInfoDto dto = _$TeamBasicInfoDtoFromJson(json);
    return TeamBasicInfoDto(
      id: id,
      name: dto.name,
      hexColor: dto.hexColor,
    );
  }

  Map<String, dynamic> toFirestore() => _$TeamBasicInfoDtoToJson(this);
}
