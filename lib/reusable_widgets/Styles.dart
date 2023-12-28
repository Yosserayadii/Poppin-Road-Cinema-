import 'package:flutter/material.dart';

class Styles {
  static ThemeData themeData(bool isDarkTheme, BuildContext context) {
    Color primaryColor = Color(0xFF171B30);
    Color secondaryColor = Color(0xFF31364D);
    Color tertiaryColor = Color(0xFF595A62);
    Color quaternaryColor = Color(0xFF68758F);
    Color quinaryColor = Color(0xFFB0B3B9);
    Color sextaryColor = Color(0xFFE4E4E4);
    Color accentColor = Color(0xFFF70113);

    return ThemeData(
      primarySwatch: Colors.red,
      scaffoldBackgroundColor: isDarkTheme ? primaryColor : Color(0xffF1F5FB),
      indicatorColor: isDarkTheme ? secondaryColor : Color(0xffCBDCF8),
      hintColor: isDarkTheme ? tertiaryColor : Color(0xffEECED3),
      highlightColor: isDarkTheme ? quaternaryColor : Color(0xffFCE192),
      hoverColor: isDarkTheme ? quinaryColor : Color(0xff4285F4),
      focusColor: isDarkTheme ? sextaryColor : Color(0xffA8DAB5),
      disabledColor: Colors.grey,
      cardTheme: CardTheme(
        color: isDarkTheme ? primaryColor : Colors.white,
        elevation: isDarkTheme ? 8 : 0,
        shadowColor: isDarkTheme ? Colors.grey[800] : null,
      ),
      canvasColor: isDarkTheme ? Colors.black : Colors.grey[50],
      brightness: isDarkTheme ? Brightness.dark : Brightness.light,
      buttonTheme: Theme.of(context).buttonTheme.copyWith(
          colorScheme: isDarkTheme ? ColorScheme.dark() : ColorScheme.light()),
      appBarTheme: const AppBarTheme(
        elevation: 1.0,
        color: Color.fromARGB(255, 17, 32, 63),
        titleTextStyle: TextStyle(color: Color.fromARGB(225, 241, 245, 251)),
      ),
      // You can define more specific theme properties using the colors you provided
    );
  }
}
