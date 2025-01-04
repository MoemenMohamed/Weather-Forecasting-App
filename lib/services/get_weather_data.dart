import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/weather_model.dart';

class GetWeatherData {
  Future<WeatherModel> getWeatherData(String cityName) async {
    var response = await http.get(Uri.parse(
        "https://api.weatherapi.com/v1/forecast.json?key=155510501e574b62ac7162445243011&q=$cityName&days=3"));
    return WeatherModel.fromJson(json.decode(response.body));
  }
}
