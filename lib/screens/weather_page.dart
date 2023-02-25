import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_divisor/screens/search_page.dart';
import 'package:weather_divisor/services/weather_module.dart';
import 'package:weather_divisor/utils/constants.dart';

class WeatherPage extends StatefulWidget {
  final dynamic locationWeather;
  const WeatherPage({Key? key, required this.locationWeather})
      : super(key: key);

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  String timeNow = DateFormat("MMM, EEE, yyyy").format(DateTime.now());
  // String dayDefinition = DateFormat("a").format(DateTime.now());

  WeatherModule weatherModule = WeatherModule();
  @override
  void initState() {
    super.initState();
    updateWeather(widget.locationWeather);
  }

  late int temperature;
  late String weatherIcon;
  late String cityName;
  late String weatherStatus;
  late String message;
  late int windSpeed;

  void updateWeather(dynamic weatherData) {
    setState(() {
      if (weatherData == null) {
        temperature = 0;
        message = "Ops! No Internet Connection";
        cityName = "";
        weatherIcon = "";
        weatherStatus = "";
        return;
      }
      var temp = weatherData['main']['temp'];
      temperature = temp.toInt();
      message = weatherModule.getMessage(temperature);
      int condition = weatherData['weather'][0]['id'];
      weatherIcon = weatherModule.getWeatherIcon(condition);
      cityName = weatherData['name'];
      weatherStatus = weatherData['weather'][0]['main'];
      var winSpeed= weatherData ['wind']['speed'];
      windSpeed = winSpeed.toInt();
      print ("speed of wind :$windSpeed");
    });
  }

  @override
  Widget build(BuildContext context) {
    var time = DateTime.now();
    int hours = time.hour;

    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            child: Container(
              height: double.maxFinite,
              color: Colors.pink,
              child: hours < 6 || hours > 17
                  ? Image.asset("assets/images/moon.png", fit: BoxFit.cover)
                  : Image.asset("assets/images/sun.png", fit: BoxFit.cover),
            ),
          ),
          Positioned(
            child: Padding(
              padding: const EdgeInsets.only(right: 50, left: 50, top: 70),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                      onTap: () async {
                        var weatherData = await weatherModule.getWeatherData();
                        updateWeather(weatherData);
                      },
                      child: const Icon(
                        Icons.my_location_sharp,
                        size: 30,
                      )),
                  InkWell(
                      onTap: () async {
                        var userCityType = await Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return const CityScreen();
                        }));

                        if (userCityType != null) {
                          var weatherData =
                              await weatherModule.getCityWeather(userCityType);
                          updateWeather(weatherData);
                        } else {
                          var weatherData =
                              await weatherModule.getWeatherData();
                          updateWeather(weatherData);
                        }
                      },
                      child: const Icon(Icons.search, size: 30)),
                ],
              ),
            ),
          ),
          Positioned(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 120, horizontal: 50),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.location_on, color: Colors.white),
                      const SizedBox(width: 5),
                      Text(cityName, style: kTextCityAndDate),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Text(timeNow, style: kTextCityAndDate),
                ],
              ),
            ),
          ),
          Positioned(
            top: 250,


            child: Padding(padding: EdgeInsets.symmetric(horizontal: 150),
              child: Text(" $temperature°",
                  style: const TextStyle(
                      fontSize: 70, fontFamily: "Cardo" )),
            ),
          ),
          Positioned(
            top: 330,
            //left: 177,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 160),
              child: Column(
                children: [
                  Text(weatherStatus,
                      style: const TextStyle(
                          fontSize: 22, fontWeight: FontWeight.w700,fontFamily: "Cardo")),
                  Row(
                    children:  [
                      const Icon(Icons.air),
                      Text(" $windSpeed km/h",
                          style: const TextStyle(
                              fontSize: 22, fontWeight: FontWeight.w600,fontFamily: "Cardo")),
                    ],
                  ),


                ],
              ),
            ),
          ),

          // Positioned(
          //   top: 190,
          //   left: 60,
          //   child: Column(
          //     children: [
          //       Text(weatherIcon,
          //           style: const TextStyle(
          //             fontSize: 70,
          //           )),
          //     ],
          //   ),
          // ),
          Container(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: const EdgeInsets.only(bottom: 20),
              padding: const EdgeInsets.all(50),
              width: double.maxFinite,
              child: Text(message,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,fontFamily: "Cardo")),
            ),
          ),
        ],
      ),
    );
  }
}
