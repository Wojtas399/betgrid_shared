import 'package:json_annotation/json_annotation.dart';

part 'user_dto.g.dart';

@JsonSerializable()
class UserDto {
  @JsonKey(includeToJson: false, includeFromJson: false)
  final String id;
  final String username;
  final ThemeModeDto themeMode;
  final ThemePrimaryColorDto themePrimaryColor;

  const UserDto({
    this.id = '',
    required this.username,
    required this.themeMode,
    required this.themePrimaryColor,
  });

  factory UserDto.fromFirestore({
    required String id,
    required Map<String, dynamic> json,
  }) {
    final UserDto dto = _$UserDtoFromJson(json);
    return UserDto(
      id: id,
      username: dto.username,
      themeMode: dto.themeMode,
      themePrimaryColor: dto.themePrimaryColor,
    );
  }

  Map<String, dynamic> toFirestore() => _$UserDtoToJson(this);
}

enum ThemeModeDto { light, dark, system }

enum ThemePrimaryColorDto {
  defaultRed,
  pink,
  purple,
  brown,
  orange,
  yellow,
  green,
  blue,
}
