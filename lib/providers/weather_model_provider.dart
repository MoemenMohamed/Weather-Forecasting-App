import 'package:flutter/material.dart';

import '../models/weather_model.dart';
import '../services/get_weather_data.dart';

class WeatherData extends ChangeNotifier {
  WeatherModel? _weatherData;
  bool isLoading = true;
  WeatherModel? get weatherData => _weatherData;
  void setData(String cityName) async {
    try {
      _weatherData = await GetWeatherData().getWeatherData(cityName);
      isLoading = false;
      notifyListeners();
    } catch (e) {
      notifyListeners();
    }
  }
}
