import 'package:flutter/material.dart';

class PersonalizeLanguageNotifier extends ChangeNotifier {
  final List<String> _selectedLanguages = [];
  bool _onSelect = false;

  bool get onSelect => _onSelect;

  void isLongPressed() {
    _onSelect = true;
    notifyListeners();
  }

  void toggleLanguages({
    required String language,
  }) {
    if (!_selectedLanguages.contains(language)) {
      _selectedLanguages.add(language);
    } else {
      _selectedLanguages.remove(language);
      if (_selectedLanguages.isEmpty) _onSelect = false;
    }
    notifyListeners();
  }

  bool isLanguageSelected({
    required String language,
  }) {
    return _selectedLanguages.contains(language);
  }

  List<String> get selectedLanguages => _selectedLanguages;
}
