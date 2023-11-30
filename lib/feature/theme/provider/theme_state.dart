import 'package:flutter/material.dart';

sealed class WeatherTheme{
  ThemeData getTheme();
}

class LightTheme extends WeatherTheme{
  @override
  ThemeData getTheme() {
    return ThemeData.light().copyWith(
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.indigo
      )
    );
  }
}

class DarkTheme extends WeatherTheme{
  @override
  ThemeData getTheme() {
    return ThemeData.dark().copyWith(
      switchTheme: SwitchThemeData(
        thumbColor: MaterialStateProperty.resolveWith((states) => Colors.white),
        trackColor: MaterialStateProperty.resolveWith((states) => Colors.grey)
      )
    );
  }

}