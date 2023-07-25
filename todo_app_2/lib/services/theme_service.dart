import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';

class ThemeService {
  final _box = GetStorage();
  final _key = 'isDarkMode';

  _saveThemeToBox(bool isDarkMode) => _box.write(_key, isDarkMode);
  bool _loadThemeFromBox() => _box.read(_key) ?? false;

  ThemeMode get theme => _loadThemeFromBox() ? ThemeMode.dark : ThemeMode.light;

  void switchTheme() {
    bool loadThemeBox = _loadThemeFromBox();
    print('********switchTheme()******');
    print('********_loadThemeFromBox()=$loadThemeBox******');
    print('********ThemeService().theme()=${ThemeService().theme}******');

    Get.changeThemeMode(loadThemeBox ? ThemeMode.light : ThemeMode.dark);
    Get.forceAppUpdate();

    _saveThemeToBox((!loadThemeBox));

    print('********ThemeService().theme()=${ThemeService().theme}******');

    print('********switchTheme()loadThemeBox=${!loadThemeBox} saved******');
  }
}