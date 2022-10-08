import 'package:flutter/material.dart';
import 'package:shared_preferences_app/enums.dart';
import 'package:shared_preferences_app/settings.dart';
import 'package:shared_preferences_app/preferences_service.dart';

void main() {
  runApp(const App());
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final _preferencesService = PreferencesService();

  final _textController = TextEditingController();
  DevelopmentType _developmentType = DevelopmentType.desktop;
  Set<ProgrammingLanguage> _selectedLanguages = {};
  bool _isEmployed = false;

  void _setLang(ProgrammingLanguage lang) {
    setState(() {
      _selectedLanguages.contains(lang)
          ? _selectedLanguages.remove(lang)
          : _selectedLanguages.add(lang);
    });
  }

  void _saveSettings() {
    final newSettings = Settings(
      username: _textController.text,
      developmentType: _developmentType,
      programmingLanguages: _selectedLanguages,
      isEmployed: _isEmployed,
    );
    _preferencesService.saveSettings(newSettings);
  }

  void _populateControls() async {
    final Settings settings = await _preferencesService.getSettings();
    setState(() {
      _textController.text = settings.username;
      _developmentType = settings.developmentType;
      _selectedLanguages = settings.programmingLanguages;
      _isEmployed = settings.isEmployed;
    });
  }

  @override
  void initState() {
    super.initState();
    _populateControls();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Shared preferences')),
        body: ListView(
          children: [
            ListTile(
              title: TextField(controller: _textController),
            ),
            ...DevelopmentType.values.map((developmentType) {
              return RadioListTile(
                title: Text(developmentType.toString()),
                value: developmentType,
                groupValue: _developmentType,
                onChanged: (value) => setState(() => _developmentType = value!),
              );
            }),
            ...ProgrammingLanguage.values.map((programmingLanguage) {
              return CheckboxListTile(
                title: Text(programmingLanguage.toString()),
                value: _selectedLanguages.contains(programmingLanguage),
                onChanged: (_) => _setLang(programmingLanguage),
              );
            }),
            SwitchListTile(
              title: const Text('Is employed'),
              value: _isEmployed,
              onChanged: (value) => setState(() => _isEmployed = value),
            ),
            TextButton(
              onPressed: _saveSettings,
              child: const Text('Save settings'),
            ),
          ],
        ),
      ),
    );
  }
}
