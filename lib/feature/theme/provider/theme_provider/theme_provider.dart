import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_weather_app/feature/theme/provider/theme_provider/theme_state.dart';






class ThemeNotifier extends Notifier<WeatherTheme>{
  final WeatherTheme _weatherTheme = LightTheme();

  @override
  WeatherTheme build() {
return _weatherTheme;
  }
  void changeTheme(WeatherTheme weatherTheme){
    state = weatherTheme;
  }


}
NotifierProvider<ThemeNotifier,WeatherTheme> themeProvider = NotifierProvider((){
  return ThemeNotifier();
});
