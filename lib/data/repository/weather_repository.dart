import 'dart:convert';

import 'package:weather_app/data/data_provider/weather_data_provider.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherRepository {
  final WeatherDataProvider weatherDataProvider;

  WeatherRepository(this.weatherDataProvider);

  Future<List<WeatherModel>> getCurrentWeather(String city) async {
    try {
      final result = await weatherDataProvider.getCurrentWeather(city);

      final data = jsonDecode(result);

      if (data['cod'] != '200') {
        throw 'An unexpected error occurred';
      }
      final weatheList = (data['list'] as List)
          .map((weather) => WeatherModel.fromMap(weather))
          .toList();
      print("Weather List : ${weatheList.length}");
      return weatheList;
      //return WeatherModel.fromMap(data);
    } catch (e) {
      throw e.toString();
    }
  }
}
