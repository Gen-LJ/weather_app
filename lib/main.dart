

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_weather_app/feature/Setting/shared_preferences/shared_preferences.dart';
import 'package:riverpod_weather_app/feature/theme/provider/theme_provider/theme_provider.dart';
import 'package:riverpod_weather_app/feature/theme/provider/theme_provider/theme_state.dart';
import 'package:riverpod_weather_app/feature/theme/provider/theme_state_provider/theme_state_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'common/const/route_list.dart';
import 'common/widget/navigation_widget.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final sharedPreferences = await SharedPreferences.getInstance();
  runApp(
      ProviderScope(
          overrides :[sharedPreferencesProvider.overrideWithValue(sharedPreferences)],
          child: MyApp()));
}

class MyApp extends ConsumerWidget {
   MyApp({super.key});
  final _router = GoRouter(
    initialLocation: '/',
      routes: [
        StatefulShellRoute.indexedStack(
          builder: (context,state,StatefulNavigationShell shell){
            return NavigationWidget(shell: shell,);
          },


            branches: RouteList.routeList)

      ]);

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    WeatherTheme weatherTheme = ref.watch(themeProvider);
    final isDark = ref.watch(isDarkProvider);
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: isDark? DarkTheme().getTheme() : LightTheme().getTheme()  ,
      routerConfig: _router,
    );
  }


}

