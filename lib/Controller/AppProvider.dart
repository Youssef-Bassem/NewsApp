import 'package:flutter/material.dart';
import 'package:news_app/UserPreferencesData.dart';

class AppProvider extends ChangeNotifier {
  String currentLanguage = "en";

  void changeLanguage(String Language) {
    if (currentLanguage == Language) return;
    currentLanguage = Language;
    UserPreferences.setLanguage(currentLanguage);
    notifyListeners();
  }
}
