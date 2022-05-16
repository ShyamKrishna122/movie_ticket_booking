import 'package:flutter/material.dart';

class PersonalizeGenreNotifier extends ChangeNotifier {
  final List<String> _selectedGenres = [];
  bool _onSelect = false;

  bool get onSelect => _onSelect;

  void isLongPressed() {
    _onSelect = true;
    notifyListeners();
  }

  void toggleGenre({
    required String genre,
  }) {
    if (!_selectedGenres.contains(genre)) {
      _selectedGenres.add(genre);
    } else {
      _selectedGenres.remove(genre);
      if (_selectedGenres.isEmpty) _onSelect = false;
    }
    notifyListeners();
  }

  bool isGenreSelected({
    required String genre,
  }) {
    return _selectedGenres.contains(genre);
  }

  List<String> get selectedGenres => _selectedGenres;
}
