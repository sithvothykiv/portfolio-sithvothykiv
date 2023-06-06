import 'package:flutter/material.dart';

class CustomTheme extends ChangeNotifier {
  bool isDarkTheme = false;
  ThemeMode get currentTheme => isDarkTheme ? ThemeMode.dark : ThemeMode.light;

  void toggleTheme() {
    isDarkTheme = !isDarkTheme;
    notifyListeners();
  }

  static ThemeData get lightTheme {
    return ThemeData(
      scaffoldBackgroundColor: Colors.white,
      hoverColor: const Color(0xFF1a4b6e).withOpacity(0.225),
      cardColor: Color.fromARGB(255, 124, 124, 124).withOpacity(0.2),
      primaryColor: Color.fromARGB(255, 35, 56, 50),
      primaryColorDark: Colors.white54,
      primaryColorLight: Colors.black,
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      scaffoldBackgroundColor: Color.fromARGB(255, 0, 0, 0),
      hoverColor: const Color(0xFF1a4b6e),
      cardColor: Color.fromARGB(255, 36, 35, 35),
      primaryColor: Color.fromARGB(255, 255, 255, 255),
      primaryColorDark: const Color(0xFF6c7582),
      primaryColorLight: Colors.white,
    );
  }
}
