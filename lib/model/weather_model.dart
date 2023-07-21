import 'package:weather_forecast/model/hourly_weather_model.dart';

class Weather {
  String? cityName;
  num? temp;
  num? wind;
  num? humidity;
  num? feelsLike;
  num? pressure;
  String? icon;
  String? condition;
  int? isDay;
  List<HourlyWeather>? hourlyWeather;

  Weather(
      {this.cityName,
      this.temp,
      this.icon,
      this.wind,
      this.hourlyWeather,
      this.isDay,
      this.humidity,
      this.condition,
      this.feelsLike,
      this.pressure});

  Weather.fromJson(Map<String, dynamic> json) {
    cityName = json['location']['name'];
    temp = json['current']['temp_c'];
    wind = json['current']['wind_kph'];
    pressure = json['current']['pressure_in'];
    humidity = json['current']['humidity'];
    feelsLike = json['current']['feelslike_c'];
    icon = json['current']['condition']['icon'];
    condition = json['current']['condition']['text'];
    isDay = json['current']['is_day'];
    hourlyWeather = parseHourlyWeather(json);
  }
}
