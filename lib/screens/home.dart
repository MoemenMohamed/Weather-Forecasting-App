import 'package:flutter/material.dart';
import '../models/weather_model.dart';
import '../services/get_weather_data.dart';
import '../widgets/forecast_tile.dart';

class HomePage extends StatefulWidget {
  final String cityName;
  const HomePage({super.key, required this.cityName});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  WeatherModel? weatherDetails;

  @override
  void initState() {
    super.initState();
    getData(widget.cityName);
  }

  void getData(String name) async {
    weatherDetails = await GetWeatherData().getWeatherData(name);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    if (weatherDetails != null) {
      return Scaffold(
        appBar: AppBar(
          title: Text("My Weather"),
          backgroundColor: Colors.lightBlueAccent.shade100,
          actions: [
            IconButton(
                onPressed: () {
                  getData(widget.cityName);
                },
                icon: Icon(Icons.refresh))
          ],
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
                    "Wind Speed:  ",style: TextStyle(fontWeight: FontWeight.bold),
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
              SizedBox(height: 30,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                ForecastTile(modelData: weatherDetails!.forecastedData[0]),
                SizedBox(width: 10,),
                ForecastTile(modelData: weatherDetails!.forecastedData[1]),
                SizedBox(width: 10,),
                ForecastTile(modelData: weatherDetails!.forecastedData[2]),
              ],)
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
