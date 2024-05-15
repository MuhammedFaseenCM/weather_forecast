import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:weather_forecast/model/weather_model.dart';
import 'package:http/http.dart' as http;

class HomeProvider extends ChangeNotifier {
  TextEditingController cityController = TextEditingController();
  Weather data = Weather();
  bool isLoading = false;

  Future<void> getData() async {
    isLoading = true;
    notifyListeners();

    if (cityController.text.isNotEmpty) {
      data = await fetchWeatherData(searchText: cityController.text);
    } else {
      data = await fetchWeatherData(searchText: "calicut");
    }
    isLoading = false;
    notifyListeners();
  }

  Future<Weather> fetchWeatherData({required String searchText}) async {
    try {
      Uri endPoint = Uri.parse(
        'http://api.weatherapi.com/v1/forecast.json?key=5f0ddc3ca5d34231af052554231004&q=$searchText&days=1&aqi=no&alerts=no',
      );
      http.Response response = await http.get(endPoint);
      return Weather.fromJson(jsonDecode(response.body));
    } catch (e) {
      debugPrint(e.toString());
      return Weather();
    }
  }
}
