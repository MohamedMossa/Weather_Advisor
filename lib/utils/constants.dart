import 'package:flutter/material.dart';

const kTextCityAndDate =
    TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold);

const kTextFiledStyle = InputDecoration(
    hintStyle: TextStyle(color: Colors.grey,fontStyle: FontStyle.italic),
    hintText: 'Enter The City Name',
    filled: true,
    fillColor: Colors.white,
    isDense: true,
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(width :1.0, color: Colors.white38),
      borderRadius: BorderRadius.all(Radius.circular(50)),

    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius: BorderRadius.all(Radius.circular(50)),
    )
);
