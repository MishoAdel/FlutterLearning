import 'package:wheather_app/models/weather_model.dart';

class WeatherState {}

class NoWeatherState extends WeatherState {}

class CorrectWeatherState extends WeatherState {
  WeatherModel weatherModel;

  CorrectWeatherState({required this.weatherModel});
}

class FailedWeatherState extends WeatherState {}
