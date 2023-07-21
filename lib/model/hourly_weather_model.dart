class HourlyWeather {
  String? time;
  String? temp;
  int? isHourDay;
  HourlyWeather({this.time, this.isHourDay, this.temp});

  HourlyWeather.fromJson(Map<String, dynamic> json) {
    time = json['time'];
    temp = json['temp_c'].toString();
    isHourDay = json['is_day'];
  }
}

List<HourlyWeather> parseHourlyWeather(json) {
  final hourlyWeatherList =
      json['forecast']['forecastday'][0]['hour'] as List<dynamic>;
  return hourlyWeatherList.map((hour) => HourlyWeather.fromJson(hour)).toList();
}
