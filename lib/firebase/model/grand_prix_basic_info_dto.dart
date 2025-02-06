import 'package:json_annotation/json_annotation.dart';

part 'grand_prix_basic_info_dto.g.dart';

@JsonSerializable()
class GrandPrixBasicInfoDto {
  @JsonKey(includeFromJson: false, includeToJson: false)
  final String id;
  final String name;
  final String countryAlpha2Code;

  const GrandPrixBasicInfoDto({
    this.id = '',
    required this.name,
    required this.countryAlpha2Code,
  });

  factory GrandPrixBasicInfoDto.fromFirestore({
    required String id,
    required Map<String, dynamic> json,
  }) {
    final dto = _$GrandPrixBasicInfoDtoFromJson(json);
    return GrandPrixBasicInfoDto(
      id: id,
      name: dto.name,
      countryAlpha2Code: dto.countryAlpha2Code,
    );
  }

  Map<String, dynamic> toFirestore() => _$GrandPrixBasicInfoDtoToJson(this);
}
