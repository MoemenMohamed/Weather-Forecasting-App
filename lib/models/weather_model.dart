class WeatherModel {
  final String locationName;
  final String locationCountry;
  final String lastUpdated;
  final double temp;
  final String conditionText;
  final String conditionIcon;
  final double windSpeedKph;
  final List<ForeCastModel> forecastedData;

  WeatherModel(
      {required this.locationName,
      required this.locationCountry,
      required this.lastUpdated,
      required this.temp,
      required this.conditionText,
      required this.conditionIcon,
      required this.windSpeedKph,
      required this.forecastedData});
  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
        conditionIcon: json["current"]["condition"]["icon"],
        conditionText: json["current"]["condition"]["text"],
        locationCountry: json["location"]["country"],
        locationName: json["location"]["name"],
        lastUpdated: json["current"]["last_updated"],
        temp: json["current"]["temp_c"],
        windSpeedKph: json["current"]["wind_kph"],
        forecastedData: [
          ForeCastModel.fromJson(json["forecast"]["forecastday"][0]),
          ForeCastModel.fromJson(json["forecast"]["forecastday"][1]),
          ForeCastModel.fromJson(json["forecast"]["forecastday"][2])
        ]);
  }
}

class ForeCastModel {
  final String forecastDate;
  final double maxTemp;
  final double minTemp;
  final String conditionText;
  final String conditionIcon;

  ForeCastModel(
      {required this.forecastDate,
      required this.maxTemp,
      required this.minTemp,
      required this.conditionText,
      required this.conditionIcon});
  factory ForeCastModel.fromJson(dynamic json2) {
    return (ForeCastModel(
        conditionIcon: json2["day"]["condition"]["icon"],
        conditionText: json2["day"]["condition"]["text"],
        maxTemp: json2["day"]["maxtemp_c"],
        minTemp: json2["day"]["mintemp_c"],
        forecastDate: json2["date"]));
  }
}
