import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';

class UserPreferences {
  static late SharedPreferences _preferences;

  static const _language = 'language';


  static Future init() async =>
      _preferences = await SharedPreferences.getInstance();

  static Future setLanguage(String language) async =>
      await _preferences.setString(_language, language);

  static String getLanguage() => _preferences.getString(_language).toString();

}
