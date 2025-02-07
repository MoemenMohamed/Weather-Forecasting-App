import 'package:flutter/material.dart';
import '../models/weather_model.dart';
import 'package:provider/provider.dart';
import '../providers/weather_model_provider.dart';
import '../widgets/forecast_tile.dart';

class HomePage extends StatelessWidget {

  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var weather = Provider.of<WeatherData>(context);
    var weatherDetails = weather.weatherData;
    if (!weather.isLoading) {
      return Scaffold(
        appBar: AppBar(
          title: Text("My Weather"),
          backgroundColor: Colors.lightBlueAccent.shade100,
        ),
        body: Container(
          color: Colors.lightBlueAccent.shade100,
          width: double.infinity,
          child: Column(
            children: [
              Image(
                image: NetworkImage("https:${weatherDetails!.conditionIcon}"),
              ),
              Text(
                weatherDetails!.conditionText,
                style: TextStyle(fontSize: 20),
              ),
              Text(
                "${weatherDetails!.temp}°",
                style: TextStyle(fontSize: 55),
              ),
              Text(
                weatherDetails!.locationName,
                style: TextStyle(fontSize: 30),
              ),
              Text(
                weatherDetails!.locationCountry,
                style: TextStyle(fontSize: 30),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Wind Speed:  ",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text("${weatherDetails!.windSpeedKph} kph")
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Last Updated:  ",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(weatherDetails!.lastUpdated)
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ForecastTile(modelData: weatherDetails!.forecastedData[0]),
                  SizedBox(
                    width: 10,
                  ),
                  ForecastTile(modelData: weatherDetails!.forecastedData[1]),
                  SizedBox(
                    width: 10,
                  ),
                  ForecastTile(modelData: weatherDetails!.forecastedData[2]),
                ],
              )
            ],
          ),
        ),
      );
    } else {
      return Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
  }
}
