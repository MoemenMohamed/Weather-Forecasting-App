import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'App/app.dart';
import 'providers/weather_model_provider.dart';

void main() {
  runApp(
      ChangeNotifierProvider(create: (context) => WeatherData(), child: App()));
}
