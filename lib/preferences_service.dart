import 'package:shared_preferences/shared_preferences.dart';
import 'package:shared_preferences_app/enums.dart';
import 'package:shared_preferences_app/settings.dart';

class PreferencesService {
  Future<void> saveSettings(Settings settings) async {
    final preferences = await SharedPreferences.getInstance();

    preferences.setString('username', settings.username);
    preferences.setInt('developmentType', settings.developmentType.index);
    preferences.setStringList(
      'programmingLanguages',
      settings.programmingLanguages.map((pl) => pl.index.toString()).toList(),
    );
    preferences.setBool('isEmployed', settings.isEmployed);
  }

  Future<dynamic> getSettings() async {
    final preferences = await SharedPreferences.getInstance();

    final String username = preferences.getString('username') ?? '';
    final int developmentTypeIndex = preferences.getInt('developmentType') ?? 0;
    final List<String> programmingLanguagesIndices =
        preferences.getStringList('programmingLanguages') ?? [];
    final bool isEmployed = preferences.getBool('isEmployed') ?? false;

    final developmentType = DevelopmentType.values[developmentTypeIndex];
    final programmingLanguages = programmingLanguagesIndices
        .map((index) => ProgrammingLanguage.values[int.parse(index)])
        .toSet();

    return Settings(
      username: username,
      developmentType: developmentType,
      programmingLanguages: programmingLanguages,
      isEmployed: isEmployed,
    );
  }
}
