import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_weather_app/feature/search_city/data/model/city_search_result.dart';
import 'package:riverpod_weather_app/feature/search_city/provider/city_search_provider.dart';
import 'package:riverpod_weather_app/feature/search_city/provider/state/city_search_state.dart';
import 'package:riverpod_weather_app/feature/search_city/ui/widget/city_list_widget.dart';
import 'package:riverpod_weather_app/feature/theme/provider/theme_provider.dart';
import 'package:riverpod_weather_app/feature/theme/provider/theme_state.dart';

class CitySearchScreen extends ConsumerStatefulWidget {
  const CitySearchScreen({super.key});

  @override
  ConsumerState<CitySearchScreen> createState() => _CitySearchScreenState();
}

class _CitySearchScreenState extends ConsumerState<CitySearchScreen> {
  TextEditingController _citySearchController = TextEditingController();
  @override
  Widget build(BuildContext context) {

    CitySearchState citySearchState = ref.watch(citySearchProvider);
    CitySearchProvider provider = ref.read(citySearchProvider.notifier);
    WeatherTheme weatherTheme = ref.watch(themeProvider);
    ThemeNotifier weatherProvider = ref.read(themeProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather For Cities'),
        actions: [
          Switch(value: (weatherTheme is DarkTheme), onChanged: (value){
            if(value){
              weatherProvider.changeTheme(DarkTheme());
            }
            else{
              weatherProvider.changeTheme(LightTheme());
            }
          })
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _citySearchController,
              decoration: InputDecoration(
                border: const OutlineInputBorder(

                ),
                labelText: 'Search City',
                suffixIcon: IconButton(onPressed: (){
                  String city = _citySearchController.text.trim();
                  if(city.isEmpty){
                    ScaffoldMessenger.of(context)
                        .showSnackBar(const SnackBar(content: Text('Please enter a city')));
                  }
                  else{
                    provider.searchCity(city);
                  }
                  
                }, icon: const Icon(Icons.search_rounded))
              ),
            ),
          ),
          Expanded(child: _citySearchResultWidget(citySearchState))
        ],
      ),
    );
  }
  Widget _citySearchResultWidget(CitySearchState citySearchState){
    return Center(
      child: switch(citySearchState){
        CitySearchForm() => const Text('Please search a city'),
        CitySearchLoading() => const CircularProgressIndicator(),
        CitySearchSuccess( citySearchResult : CitySearchResult citySearchResult) => CityList(citySearchResult: citySearchResult),
        CitySearchFailed(errorMessage : String error) => const Text('error')

      },
    );
  }
}
