import 'package:flutter/material.dart';

extension DarkMode on BuildContext {
  /// is dark mode currently enabled?
  bool get isDarkMode {
    final ThemeData mode = Theme.of(this);

    // var whichMode=mode.brightness;

    final brightness =
        mode.brightness; //MediaQuery.of(this).platformBrightness;
    return brightness == Brightness.dark;
  }

  Color getTextColor() {
    if (isDarkMode) {
      return Colors.grey[100] as Color;
    } else {
      return Colors.black87;
    }
  }
}
