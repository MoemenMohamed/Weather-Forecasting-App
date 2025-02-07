import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/weather_model_provider.dart';
import 'home.dart';

List<String> list = [
  "Bangkok",
  "Beijing",
  "Beirut",
  "Berlin",
  "Buenos Aires",
  "Cairo",
  "Cape Town",
  "Casablanca",
  "Chicago",
  "Delhi",
  "Doha",
];

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent.shade100,
        title: Text("Welcome ..."),
      ),
      body: Container(
        color: Colors.lightBlueAccent.shade100,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: DropdownButton<String>(
                underline: SizedBox(),
                items: list.map<DropdownMenuItem<String>>((value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (value) {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    Provider.of<WeatherData>(context).setData(value!);
                    return HomePage();
                  }));
                },
                hint: Text(
                  "Select a city",
                  style: TextStyle(fontSize: 30),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
