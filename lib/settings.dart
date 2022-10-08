import 'package:shared_preferences_app/enums.dart';

class Settings {
  final String username;
  final DevelopmentType developmentType;
  final Set<ProgrammingLanguage> programmingLanguages;
  final bool isEmployed;

  const Settings({
    required this.username,
    required this.developmentType,
    required this.programmingLanguages,
    required this.isEmployed,
  });
}
