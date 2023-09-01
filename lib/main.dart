import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_weather_app/feature/search_city/ui/screen/city_search_screen.dart';

void main() {
  runApp( ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
   MyApp({super.key});
  final _router = GoRouter(
      routes: [
      GoRoute(path: '/',
      builder: (context,routeState){
        return const CitySearchScreen();
      })
      ]);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
    );
  }
}

