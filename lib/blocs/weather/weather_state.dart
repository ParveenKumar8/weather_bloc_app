part of 'weather_bloc.dart';

@immutable
sealed class WeatherState {}

final class WeatherInitial extends WeatherState {}

final class WeatherSuccess extends WeatherState {
  final WeatherModel weatherModel;

  WeatherSuccess(this.weatherModel);
}

final class WeatherError extends WeatherState {
  final String errorMsg;

  WeatherError(this.errorMsg);
}

final class WeatherLoading extends WeatherState {}
