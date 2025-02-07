class TeamBasicInfoDto {
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
    return TeamBasicInfoDto(
      id: id,
      name: json[TeamBasicInfoFields.name],
      hexColor: json[TeamBasicInfoFields.hexColor],
    );
  }

  Map<String, dynamic> toFirestore() => {
        TeamBasicInfoFields.name: name,
        TeamBasicInfoFields.hexColor: hexColor,
      };
}

class TeamBasicInfoFields {
  static const String name = 'name';
  static const String hexColor = 'hexColor';
}
