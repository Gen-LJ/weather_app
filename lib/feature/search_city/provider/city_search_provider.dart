import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_weather_app/common/provider/dio/dio_provider.dart';
import 'package:riverpod_weather_app/feature/search_city/data/model/city_search_result.dart';
import 'package:riverpod_weather_app/feature/search_city/data/service/city_search_service.dart';
import 'package:riverpod_weather_app/feature/search_city/provider/state/city_search_state.dart';
import 'package:dio/dio.dart';


class CitySearchProvider extends Notifier{
  CitySearchState citySearchState = CitySearchLoading();

  @override
  build() {
    return citySearchState;
  }
  late final Dio _dio = ref.read(dioProvider);
  late final CitySearchService _citySearchService = CitySearchService(_dio);
void searchCity(String name) async{
  citySearchState = CitySearchLoading();
  try {
    CitySearchResult citySearchResult = await _citySearchService.searchCity(
        name: name, count: 10, language: 'en', format: 'json');
    citySearchState = CitySearchSuccess(citySearchResult);
  }
  catch(e){
    citySearchState = CitySearchFailed (e.toString());
  }
}
}