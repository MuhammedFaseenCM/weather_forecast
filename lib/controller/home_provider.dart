import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:weather_forecast/model/weather_model.dart';
import 'package:http/http.dart' as http;

class HomeProvider extends ChangeNotifier {
  TextEditingController cityController = TextEditingController();
}

Future<Weather> fetchWatherData({required String searchText}) async {
  try {
    print("api calling- fetch");
    var endPoint = Uri.parse(
      'http://api.weatherapi.com/v1/forecast.json?key=5f0ddc3ca5d34231af052554231004&q=$searchText&days=1&aqi=no&alerts=no',
    );
    var response = await http.get(endPoint);
    print(response.statusCode);
    if (response.statusCode == 200) {
      var body = jsonDecode(response.body);

      Weather weather = Weather.fromJson(body);
      return weather;
    } else {
      return Weather();
    }
  } catch (e) {
    print(e.toString());
    return Weather();
  }
}

//

//

//


