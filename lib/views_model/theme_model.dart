import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum AppTheme{
 LightMode, DarkMode
}
class ThemeModel extends ChangeNotifier{
  AppTheme appTheme = AppTheme.LightMode;
  ThemeData themeData = ThemeData.light();
  void changeTheme(AppTheme newTheme) {
    if(newTheme == appTheme){
      return;
    }
    switch (newTheme) {
      case AppTheme.LightMode:
        themeData = ThemeData.light();
        break;
      case AppTheme.DarkMode:
        themeData = ThemeData.dark();
        break;
    }
    appTheme = newTheme;
    notifyListeners();
  }
}