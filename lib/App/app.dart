import 'package:flutter/material.dart';
import '../screens/search_screen.dart';

class App extends StatelessWidget {
    // Private constructor
  const App._internal();

  // The single instance of the App
  static final App _instance = App._internal();

  // Factory constructor to return the single instance
  factory App() {
    return _instance;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SearchScreen(),
    );
  }
}