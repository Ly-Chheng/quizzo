import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AppTheme {
  bool darkStatus = false;
  final _getStorage = GetStorage();
  final _darkThemeKey = 'isDarkTheme';
  final _toggleKey = 'isToggle';

  void saveThemeData(bool isDarkMode) {
    _getStorage.write(_darkThemeKey, isDarkMode);
  }

  bool isSavedDarkMode() {
    return _getStorage.read(_darkThemeKey) ?? false;
  }

  ThemeMode getThemeMode() {
    return isSavedDarkMode() ? ThemeMode.dark : ThemeMode.light;
  }

  void changeTheme(darkValue) {
    Get.changeThemeMode(isSavedDarkMode() ? ThemeMode.light : ThemeMode.dark);
    saveThemeData(!isSavedDarkMode());
    darkStatus = darkValue;
    _getStorage.write(_toggleKey, darkValue);
  }
}
