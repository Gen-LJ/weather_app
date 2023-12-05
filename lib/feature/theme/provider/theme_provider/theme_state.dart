import 'package:flutter/material.dart';

sealed class WeatherTheme {
  ThemeData getTheme();
}

class LightTheme extends WeatherTheme {
  @override
  ThemeData getTheme() {
    return ThemeData.light().copyWith(
        appBarTheme: const AppBarTheme(backgroundColor: Colors.indigo),
        navigationRailTheme: const NavigationRailThemeData(
            unselectedIconTheme: IconThemeData(color: Colors.grey),
            selectedIconTheme: IconThemeData(color: Colors.indigo),
            selectedLabelTextStyle: TextStyle(color: Colors.indigo),
            unselectedLabelTextStyle: TextStyle(color: Colors.grey))
    );
  }
}

class DarkTheme extends WeatherTheme {
  @override
  ThemeData getTheme() {
    return ThemeData.dark().copyWith(
        switchTheme: SwitchThemeData(
            thumbColor:
                MaterialStateProperty.resolveWith((states) => Colors.white),
            trackColor:
                MaterialStateProperty.resolveWith((states) => Colors.grey)),
        navigationRailTheme: const NavigationRailThemeData(
            unselectedIconTheme: IconThemeData(color: Colors.grey),
            selectedIconTheme: IconThemeData(color: Colors.white),
            selectedLabelTextStyle: TextStyle(color: Colors.white),
            unselectedLabelTextStyle: TextStyle(color: Colors.grey))

    );
  }
  }

