part of 'weather_bloc.dart';

@immutable
sealed class WeatherEvent {}

final class WeatherUpdateRequest extends WeatherEvent {
  final String cityName;

  WeatherUpdateRequest(this.cityName);
}
