import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_weather_app/feature/search_city/data/model/city_search_result.dart';

class CityList extends StatelessWidget {
  const CityList({super.key, required this.citySearchResult});

  final CitySearchResult citySearchResult;

  @override
  Widget build(BuildContext context) {
    List<Results>? cities = citySearchResult.results;
    return ListView.builder(
        itemCount: cities?.length ?? 0,
        itemBuilder: (context, index) {
          Results? results = cities?[index];
          return Card(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(results?.name ?? ''),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(results?.country ?? ''),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(results?.admin1 ?? ''),
                    )
                  ],
                ),
                CachedNetworkImage(
                    imageUrl:
                    'https://flagsapi.com/${results?.countryCode}/flat/64.png',
                  width: 64,
                  height: 64,
                  progressIndicatorBuilder: (_,__,___) => const Center(child: CircularProgressIndicator(), ),
                    errorWidget: (_,__,___) => const Center(child: Icon(Icons.error,color: Colors.red,),)

                )

          ],
            ),
          );
        });
  }
}
