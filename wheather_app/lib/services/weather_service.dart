import 'package:wheather_app/models/weather_model.dart';
import 'package:dio/dio.dart';

class WeatherService {
  final Dio dio;

  String baseURL = 'http://api.weatherapi.com/v1';
  String key = '74313d9847c04393bc6113355242008';

  WeatherService(this.dio);

  Future<WeatherModel> getWeatherNow(String cityName) async {
    try {
      Response response = await dio.get(
          '$baseURL/forecast.json?key=$key&q=$cityName&days=1&aqi=no&alerts=no');
      WeatherModel myWeather = WeatherModel.fromjson(response.data);
      return myWeather;
    } on DioException catch (e) {
      final String errorMsg = e.response?.data['error']['message'] ??
          "Opps, there was an error . Please try again later";
      throw Exception(errorMsg);
    } catch (e) {
      // log(e.toString());
      throw Exception("Opps, there was an error . Please try again later");
    }
  }
}
