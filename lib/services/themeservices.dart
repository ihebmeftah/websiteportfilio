import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ThemeServices {
  final GetStorage _box = GetStorage();
  final _key = 'isDarkMode';

  _savethemetobox(bool isDarkMode) => _box.write(_key, isDarkMode);

  bool isDark() => _box.read<bool>(_key) ?? false;

  ThemeMode get theme => isDark() ? ThemeMode.light : ThemeMode.dark;
  void switchTheme() {
    Get.changeThemeMode(isDark() ? ThemeMode.dark : ThemeMode.light);
    _savethemetobox(!isDark());
  }
}
