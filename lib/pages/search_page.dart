import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/core/constants.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/providers/weather_provider.dart';
import 'package:weather_app/services/weather_service.dart';

class SearchPage extends StatelessWidget {
  SearchPage({Key? key}) : super(key: key);
  String? cityName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Search a City"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            child: TextField(
              decoration: InputDecoration(
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                label: const Text("Search"),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                hintText: "Enter a city",
                hintStyle: const TextStyle(fontSize: 20),
                suffixIcon: IconButton(
                    onPressed: () async {
                      WeatherService service = WeatherService();
                      WeatherModel? weather =
                          await service.getWeather(cityName: cityName!);

                      Provider.of<WeatherProvider>(context, listen: false)
                          .weatherData = weather;

                      Get.back();
                    },
                    icon: const Icon(Icons.search)),
              ),
              onChanged: (value) {
                cityName = value;
              },
              onSubmitted: (value) async {
                cityName = value;
                WeatherService service = WeatherService();
                WeatherModel? weather =
                    await service.getWeather(cityName: cityName!);

                Provider.of<WeatherProvider>(context, listen: false)
                    .weatherData = weather;

                Get.back();
              },
            ),
          ),
        ),
      ),
    );
  }
}
