import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_weather_app/feature/Setting/shared_preferences/shared_preferences.dart';

import '../theme/provider/theme_provider/theme_provider.dart';
import '../theme/provider/theme_provider/theme_state.dart';
import '../theme/provider/theme_state_provider/theme_state_provider.dart';

class SettingScreen extends ConsumerStatefulWidget {
  const SettingScreen({super.key});

  @override
  ConsumerState<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends ConsumerState<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    WeatherTheme weatherTheme = ref.watch(themeProvider);
    ThemeNotifier weatherProvider = ref.read(themeProvider.notifier);
    final isDark = ref.watch(isDarkProvider);


    return  Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Setting'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 10,right: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Change Theme'),
            Switch(value: ( isDark == true ),
                onChanged: (value){
                ref.read(isDarkProvider.notifier).toggleTheme();
            })
          ],
        ),
      ),
    );
  }
}
