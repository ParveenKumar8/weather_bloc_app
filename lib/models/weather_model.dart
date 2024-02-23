// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class WeatherModel {
  /*
      final currentTemp = currentWeatherData['main']['temp'];
      final currentSky = currentWeatherData['weather'][0]['main'];
      final currentPressure = currentWeatherData['main']['pressure'];
      final currentWindSpeed = currentWeatherData['wind']['speed'];
      final currentHumidity = currentWeatherData['main']['humidity'];
  */
  final String currenTemp;
  final String currentSky;
  final String currentPressure;
  final String currentWindSpeed;
  final String currentHumidity;

  WeatherModel({
    required this.currenTemp,
    required this.currentSky,
    required this.currentPressure,
    required this.currentWindSpeed,
    required this.currentHumidity,
  });

  WeatherModel copyWith({
    String? currenTemp,
    String? currentSky,
    String? currentPressure,
    String? currentWindSpeed,
    String? currentHumidity,
  }) {
    return WeatherModel(
      currenTemp: currenTemp ?? this.currenTemp,
      currentSky: currentSky ?? this.currentSky,
      currentPressure: currentPressure ?? this.currentPressure,
      currentWindSpeed: currentWindSpeed ?? this.currentWindSpeed,
      currentHumidity: currentHumidity ?? this.currentHumidity,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'currenTemp': currenTemp,
      'currentSky': currentSky,
      'currentPressure': currentPressure,
      'currentWindSpeed': currentWindSpeed,
      'currentHumidity': currentHumidity,
    };
  }

  factory WeatherModel.fromMap(Map<String, dynamic> map) {
    final currentWeatherData = map['list'][0];
    WeatherModel? model;
    try {
      model = WeatherModel(
        currenTemp: currentWeatherData['main']['temp'].toString(),
        currentSky: currentWeatherData['weather'][0]['main'].toString(),
        currentPressure: currentWeatherData['main']['pressure'].toString(),
        currentWindSpeed: currentWeatherData['wind']['speed'].toString(),
        currentHumidity: currentWeatherData['main']['humidity'].toString(),
      );
    } catch (e) {
      print(e.toString());
    }
    return model!;
  }

  String toJson() => json.encode(toMap());

  factory WeatherModel.fromJson(String source) =>
      WeatherModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'WeatherModel(currenTemp: $currenTemp, currentSky: $currentSky, currentPressure: $currentPressure, currentWindSpeed: $currentWindSpeed, currentHumidity: $currentHumidity)';
  }

  @override
  bool operator ==(covariant WeatherModel other) {
    if (identical(this, other)) return true;

    return other.currenTemp == currenTemp &&
        other.currentSky == currentSky &&
        other.currentPressure == currentPressure &&
        other.currentWindSpeed == currentWindSpeed &&
        other.currentHumidity == currentHumidity;
  }

  @override
  int get hashCode {
    return currenTemp.hashCode ^
        currentSky.hashCode ^
        currentPressure.hashCode ^
        currentWindSpeed.hashCode ^
        currentHumidity.hashCode;
  }
}
