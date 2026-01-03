import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather/weather.dart';
import 'package:whats_the_weather/data/my_data.dart';
import 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit() : super(WeatherInitial());

  Future<void> fetchWeather(Position position) async {
    emit(WeatherLoading());

    try {
      final WeatherFactory wf =
          WeatherFactory(apiKey!, language: Language.ENGLISH);

      final Weather weather = await wf.currentWeatherByLocation(
        position.latitude,
        position.longitude,
      );

      emit(WeatherSuccess(weather));
    } catch (e) {
      emit(const WeatherFailure('Failed to fetch weather'));
    }
  }
}
