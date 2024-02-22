import 'package:flutter/material.dart';

import 'dark_mode.dart';
import 'light_mode.dart';

class ThemeProvider extends ChangeNotifier{
  ThemeData _themeData = lightMode;

  // get Theme
  ThemeData get themeData => _themeData;

  // is dark mode
  bool get isDarkMode => _themeData == darkMode;

  // set Theme
  void setThemeData(ThemeData themeData){
    _themeData = themeData;
    notifyListeners();
  }

  // toggle Theme
  void toggleThemeData(){
    _themeData = _themeData == lightMode ? darkMode : lightMode;
    notifyListeners();
  }
}