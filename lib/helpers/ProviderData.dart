import 'package:flutter/material.dart';
import 'package:video_book/constants/Styles.dart';

class ProviderData extends ChangeNotifier {
  int themeValueFromCache = AppThemes.themeLight;

  void updateThemeValue(int value){
    themeValueFromCache = value;
    notifyListeners();
  }
}
