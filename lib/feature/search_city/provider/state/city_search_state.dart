import 'package:riverpod_weather_app/feature/search_city/data/model/city_search_result.dart';

sealed class CitySearchState{}

class CitySearchLoading extends CitySearchState{}
class CitySearchForm extends CitySearchState{}
class CitySearchSuccess extends CitySearchState{
  final CitySearchResult citySearchResult;
  CitySearchSuccess(this.citySearchResult);
}
class CitySearchFailed extends CitySearchResult{
  final String errorMessage;
  CitySearchFailed(this.errorMessage);
}