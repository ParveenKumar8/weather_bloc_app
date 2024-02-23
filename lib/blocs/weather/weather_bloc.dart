import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:weather_app/data/repository/weather_repository.dart';
import 'package:weather_app/models/weather_model.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRepository weatherRepository;
  WeatherBloc(this.weatherRepository) : super(WeatherInitial()) {
    on<WeatherUpdateRequest>(_weatherUpdateRequested);
  }

  void _weatherUpdateRequested(
      WeatherUpdateRequest event, Emitter<WeatherState> emit) async {
    try {
      emit(WeatherLoading());

      final WeatherModel weatherModel =
          await weatherRepository.getCurrentWeather(event.cityName);
      //print(weatherModel.toString());
      emit(WeatherSuccess(weatherModel));
    } catch (e) {
      print(e.toString());
      emit(WeatherError(e.toString()));
    }
  }
}
