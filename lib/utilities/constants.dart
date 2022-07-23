import 'package:flutter/material.dart';

const kapiKey = '6a89b9580e70b960513cb9888386a521';
const kopenWeatherUrl = 'https://api.openweathermap.org/data/2.5/weather';

const kTempTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 100.0,
);

const kMessageTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 60.0,
);

const kButtonTextStyle = TextStyle(
  fontSize: 30.0,
  fontFamily: 'Spartan MB',
);

const kConditionTextStyle = TextStyle(
  fontSize: 100.0,
);

const kTextInputDecoration = InputDecoration(
  icon: Icon(
    Icons.location_city,
    color: Colors.white,
  ),
  border: OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(10),
      ),
      borderSide: BorderSide.none),
  hintText: 'Enter City Name',
  hintStyle: TextStyle(
    color: Colors.grey,
  ),
  fillColor: Colors.white,
  filled: true,
);
