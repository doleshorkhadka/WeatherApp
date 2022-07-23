// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:WeatherApp/screens/city_screens.dart';
import 'package:WeatherApp/services/weather.dart';
import 'package:flutter/material.dart';
import '../utilities/constants.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class LocationScreen extends StatefulWidget {
  LocationScreen({required this.weatherData});
  final weatherData;
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  WeatherModel weatherModel = WeatherModel();
  int? temperature;
  String? cityName;
  String? weatherIcon;
  String? weatherMessage;
  @override
  void initState() {
    super.initState();
    changeUI(widget.weatherData);
  }

  void changeUI(dynamic data) {
    setState(() {
      if (data != null) {
        temperature = data['main']['temp'].toInt();
        cityName = data['name'];
        weatherIcon = weatherModel.getWeatherIcon(data['weather'][0]['id']);
        weatherMessage = weatherModel.getMessage(temperature!);
      } else {
        weatherIcon = '😞';
        weatherMessage = 'Not Found';
        cityName = '?';
        temperature = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/location_background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  FlatButton(
                    onPressed: () async {
                      var data = await weatherModel.getWeatherData();
                      if (data == null) {
                        Alert(
                                context: context,
                                type: AlertType.error,
                                title: "Error",
                                desc: "Error while fetching data.")
                            .show();
                      } else {
                        changeUI(data);
                      }
                    },
                    child: Icon(
                      Icons.near_me,
                      size: 50.0,
                    ),
                  ),
                  FlatButton(
                    onPressed: () async {
                      var typedName = await Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) {
                          return CityScreen();
                        }),
                      );
                      if (typedName != null) {
                        var data = await weatherModel.getCityData(typedName);
                        if (data == null) {
                          Alert(
                                  context: context,
                                  type: AlertType.error,
                                  title: "Error",
                                  desc: "Error while fetching data.")
                              .show();
                        } else {
                          changeUI(data);
                        }
                      }
                    },
                    child: Icon(
                      Icons.location_city,
                      size: 50.0,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      '$temperature°',
                      style: kTempTextStyle,
                    ),
                    Text(
                      '$weatherIcon',
                      style: kConditionTextStyle,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: Text(
                  "$weatherMessage in $cityName!",
                  textAlign: TextAlign.right,
                  style: kMessageTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
