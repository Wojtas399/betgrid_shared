class UserDto {
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
    return UserDto(
      id: id,
      username: json[UserFields.username],
      themeMode: json[UserFields.themeMode],
      themePrimaryColor: json[UserFields.themePrimaryColor],
    );
  }

  Map<String, dynamic> toFirestore() => {
        UserFields.username: username,
        UserFields.themeMode: themeMode,
        UserFields.themePrimaryColor: themePrimaryColor,
      };
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

class UserFields {
  static const String username = 'username';
  static const String themeMode = 'themeMode';
  static const String themePrimaryColor = 'themePrimaryColor';
}
