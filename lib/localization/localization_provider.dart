import 'package:flutter/material.dart';

class LocalizationProvider extends ChangeNotifier {
  Locale _locale = Locale('en', ''); // Default language is English

  Locale get locale => _locale;

  void changeLocale(String languageCode) {
    _locale = Locale(languageCode, '');
    notifyListeners();
  }
}
