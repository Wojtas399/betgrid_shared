import 'package:json_annotation/json_annotation.dart';

part 'driver_personal_data_dto.g.dart';

@JsonSerializable()
class DriverPersonalDataDto {
  @JsonKey(includeFromJson: false, includeToJson: false)
  final String id;
  final String name;
  final String surname;

  DriverPersonalDataDto({
    this.id = '',
    required this.name,
    required this.surname,
  });

  factory DriverPersonalDataDto.fromFirestore({
    required String id,
    required Map<String, dynamic> json,
  }) {
    final dto = _$DriverPersonalDataDtoFromJson(json);
    return DriverPersonalDataDto(
      id: id,
      name: dto.name,
      surname: dto.surname,
    );
  }

  Map<String, dynamic> toFirestore() => _$DriverPersonalDataDtoToJson(this);
}
