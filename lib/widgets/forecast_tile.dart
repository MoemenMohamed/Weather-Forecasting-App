import 'package:flutter/material.dart';

import '../models/weather_model.dart';

class ForecastTile extends StatelessWidget {
  final ForeCastModel modelData;
  const ForecastTile({super.key, required this.modelData});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(15))),
      width: 120,
      child: Column(
        children: [
          Image(image: NetworkImage("https:${modelData.conditionIcon}")),
          Text(modelData.conditionText,style: TextStyle(fontWeight: FontWeight.bold),),
          Text("${modelData.maxTemp}°/${modelData.minTemp}°"),
          Text(modelData.forecastDate),
          
        ],
      ),
    );
  }
}
