import 'package:go_router/go_router.dart';

import '../../feature/Setting/setting.dart';
import '../../feature/current_weather/ui/screen/current_weather_screen.dart';
import '../../feature/search_city/ui/screen/city_search_screen.dart';

class RouteList{
  static final routeList =
    [
      StatefulShellBranch(routes: [
        GoRoute(path: '/',
            builder: (context,routeState){
              return const CitySearchScreen();
            }),
        GoRoute(path: '/current',
            builder: (context,routeState){
              final query = routeState.extra as Map;
              return  CurrentWeatherScreen(
                latitude: query['lati']!,
                longitude: query['longi']!,
                city: query['city']!,);
            })
      ]),
      StatefulShellBranch(routes: [
        GoRoute(path: '/setting',
            builder: (context,routeState){
              return SettingScreen();
            })
      ])
    ]
  ;
}