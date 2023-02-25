import 'package:flutter/material.dart';

import '../utils/constants.dart';

class CityScreen extends StatefulWidget {
  const CityScreen({super.key});

  @override
  State<CityScreen> createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  String cityName = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/Blood.png'),
            fit: BoxFit.cover,
          ),
        ),
        constraints: const BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Align(
                alignment: Alignment.topLeft,
                child: MaterialButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    Icons.arrow_back_ios,
                    size: 50.0,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(20.0),
                child: TextField(
                  onChanged: (value) {
                    cityName = value;
                  },
                  style: const TextStyle(color: Colors.black),
                  decoration: kTextFiledStyle,
                ),
              ),
              MaterialButton(
                onPressed: () {
                  if (cityName == "") {
                    Navigator.pop(context);
                  } else {

                    Navigator.pop(context, cityName);
                  }
                },
                child: const Text(
                  'Get Weather',
                  style: kTextCityAndDate,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
