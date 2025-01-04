import 'package:flutter/material.dart';

import 'home.dart';

List<String> list = [
  "Abu Dhabi",
  "Addis Ababa",
  "Algiers",
  "Amman",
  "Amsterdam",
  "Athens",
  "Baghdad",
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
  "Dubai",
  "Jeddah",
  "Johannesburg",
  "Jakarta",
  "Kuala Lumpur",
  "Khartoum",
  "Lagos",
  "Lisbon",
  "London",
  "Los Angeles",
  "Madrid",
  "Marrakech",
  "Melbourne",
  "Mexico City",
  "Miami",
  "Mumbai",
  "Muscat",
  "Nairobi",
  "New York",
  "Paris",
  "Prague",
  "Rio de Janeiro",
  "Riyadh",
  "Rome",
  "São Paulo",
  "Seoul",
  "Shanghai",
  "Singapore",
  "Sydney",
  "Tokyo",
  "Toronto",
  "Tripoli",
  "Tunis",
  "Vancouver",
  "Vienna"
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
              child: Container(
                margin: EdgeInsets.all(10),
                width: 210,
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
                      return HomePage(cityName: value!,);
                    }));
                  },
                  hint: Text(
                    "Select a city",
                    style: TextStyle(fontSize: 30),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
