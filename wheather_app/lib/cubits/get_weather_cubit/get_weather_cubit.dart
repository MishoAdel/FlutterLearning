import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wheather_app/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:wheather_app/models/weather_model.dart';
import 'package:wheather_app/services/weather_service.dart';

class GetWeatherCubit extends Cubit<WeatherState> {
  GetWeatherCubit() : super(NoWeatherState());

  WeatherModel? myWeatherModel;

  getWeather({required String cityName}) async {
    try {
      myWeatherModel = await WeatherService(Dio()).getWeatherNow(cityName);
      emit(CorrectWeatherState(weatherModel: myWeatherModel!));
    } catch (e) {
      emit(FailedWeatherState());
    }
  }
}
