import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/models/weather_model.dart';

class WeatherService {
  String baseUrl = 'http://api.weatherapi.com/v1';
  String apiKey = 'dce93ad507254d1580d74935221608';
  Future<WeatherModel?> getWeather({required String cityName}) async {
    WeatherModel? weather;

    try {
      http.Response response = await http.get(Uri.parse(
          '$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=2&aqi=no&alerts=no'));
      Map<String, dynamic> data = jsonDecode(response.body);

      weather = WeatherModel.fromJson(data);
    } catch (e) {
      Exception();
    }
    return weather;
  }
}
