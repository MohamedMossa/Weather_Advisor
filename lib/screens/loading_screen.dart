import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weather_divisor/screens/weather_page.dart';
import 'package:weather_divisor/services/locatiom.dart';
import 'package:weather_divisor/services/network_helper.dart';
import 'package:weather_divisor/services/weather_module.dart';

class LoadingScreen extends StatefulWidget {
  LoadingScreen({Key? key}) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
 late var weatherData ;
  @override
  void initState() {
    getLocationData();
    super.initState();
  }

  getLocationData() async {
    WeatherModule weatherModule = WeatherModule();
    weatherData = await weatherModule.getWeatherData();
    if (mounted) {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return WeatherPage(locationWeather: weatherData,);
      }

      ));
    }
  }
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          size: 100,
          color: Colors.indigo,
        ),
      ),
    );
  }
}
