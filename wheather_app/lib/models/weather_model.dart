class WeatherModel {
  WeatherModel(
      {required this.cityName,
      required this.imgPath,
      required this.condition,
      required this.updateDate,
      required this.avgTemp,
      required this.maxTemp,
      required this.minTemp});

  String cityName;
  String imgPath;
  String updateDate;
  String condition;

  double avgTemp;
  double maxTemp;
  double minTemp;

  factory WeatherModel.fromjson(json) {
    return WeatherModel(
      imgPath: json["current"]["condition"]["icon"],
      cityName: json["location"]["name"],
      updateDate: json["current"]["last_updated"],
      avgTemp: json["forecast"]["forecastday"][0]["day"]["avgtemp_c"],
      maxTemp: json["forecast"]["forecastday"][0]["day"]["maxtemp_c"],
      minTemp: json["forecast"]["forecastday"][0]["day"]["mintemp_c"],
      condition: json["forecast"]["forecastday"][0]["day"]["condition"]["text"],
    );
  }
}
