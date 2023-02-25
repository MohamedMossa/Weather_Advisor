import 'package:flutter/material.dart';
import 'package:weather_divisor/screens/loading_screen.dart';
import 'package:weather_divisor/screens/search_page.dart';
import 'package:weather_divisor/screens/weather_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'WeatherDivisor',
      theme: ThemeData.dark(),


      home:  LoadingScreen()
    );
  }
}
