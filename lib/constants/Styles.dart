import 'package:flutter/material.dart';
import 'package:video_book/constants/AppStrings.dart';

final sendButtonTextStyle = TextStyle(
  color: ThemeData().primaryColor,
  fontWeight: FontWeight.bold,
  fontSize: 18.0,
);

const messageTextFieldDecoration = InputDecoration(
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  hintText: AppStrings.commentBoxHint,
  border: InputBorder.none,
);

final messageContainerDecoration = BoxDecoration(
  border: Border(
    top: BorderSide(color: ThemeData().primaryColor, width: 2.0),
  ),
);

class AppThemes {
  static const int themeLight = 1;
  static const int themeDark = 2;

  static ThemeData getThemeFromSettings(int value) {
    if (value == themeLight) {
      return getLightTheme();
    } else {
      return getDarkTheme();
    }
  }

  static ThemeData getDarkTheme() {
    ThemeData darkTheme = ThemeData.dark().copyWith(
        colorScheme: const ColorScheme.dark().copyWith(
            secondary: Colors.blue,
            primary: Colors.blue,
            onPrimary: Colors.white,
            onSecondary: Colors.white),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.blue,
        ));

    return darkTheme;
  }

  static ThemeData getLightTheme() {
    ThemeData lightTheme = ThemeData.light().copyWith(
        colorScheme: const ColorScheme.light().copyWith(
            secondary: Colors.blue,
            primary: Colors.blue,
            onPrimary: Colors.white,
            onSecondary: Colors.white),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.blue,
        ));

    return lightTheme;
  }
}
