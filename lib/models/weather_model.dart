import 'package:flutter/material.dart';

class WeatherModel {
  String name;
  String date;
  double temp;
  double maxTemp;
  double minTemp;
  String weatherStateName;
  String image;

  WeatherModel(
      {
      required this.name,
      required this.date,
      required this.temp,
      required this.maxTemp,
      required this.minTemp,
      required this.weatherStateName,
      required this.image});

//factory constructure return object of type WeatherModel and the attribuites can be nullable
  factory WeatherModel.fromJson(dynamic data) {
    var jsonData = data['forecast']['forecastday'][0]['day'];
    return WeatherModel(
        name: data['location']['name'],
        date: data['location']['localtime'],
        temp: jsonData['avgtemp_c'],
        maxTemp: jsonData['avgtemp_c'],
        minTemp: jsonData['mintemp_c'],
        weatherStateName: jsonData['condition']['text'],
        image: jsonData['condition']['icon']);
  }

  MaterialColor getTheme() {
    if (weatherStateName == 'Clear' || weatherStateName == 'Light Cloud') {
      return Colors.orange;
    } else if (weatherStateName == 'Sleet' ||
        weatherStateName == 'Snow' ||
        weatherStateName == 'Hail') {
      return Colors.blue;
    } else if (weatherStateName == 'Heavy Cloud') {
      return Colors.blueGrey;
    } else if (weatherStateName == 'Light Rain' ||
        weatherStateName == 'Heavy Rain' ||
        weatherStateName == 'Showers') {
      return Colors.blue;
    } else if (weatherStateName == 'Sunny') {
      return Colors.yellow;
    }
    return Colors.blue;
  }

  @override
  String toString() {
    return "date = $date, and temp = $temp, max temp = $maxTemp, min temp = $minTemp and state = $weatherStateName";
  }
}
