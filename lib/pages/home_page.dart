import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/pages/search_page.dart';
import 'package:weather_app/providers/weather_provider.dart';

import '../core/constants.dart';
import '../core/utils/size_config.dart';
import '../models/weather_model.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: titleColor,
        actions: [
          Center(
            child: IconButton(
                onPressed: () {
                  Get.to(SearchPage());
                },
                icon: const Icon(Icons.search)),
          )
        ],
        title: Text(
          "Weather App",
          style: TextStyle(fontSize: titleSize),
        ),
      ),
      body: Provider.of<WeatherProvider>(context, listen: true).weatherData ==
              null
          ? Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "there is no weather 😞 start searching now 🔍",
                    style: TextStyle(fontSize: SizeConfig.defaultSize! * 2.5),
                    maxLines: 2,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            )
          : Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                Provider.of<WeatherProvider>(context).weatherData!.getTheme(),
                Provider.of<WeatherProvider>(context).weatherData!.getTheme()[300]!,
                Provider.of<WeatherProvider>(context).weatherData!.getTheme()[100]!,
              ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
              width: SizeConfig.screenWidth,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Spacer(
                    flex: 3,
                  ),
                  Text(
                    '${Provider.of<WeatherProvider>(context).weatherData!.name}',
                    style: TextStyle(
                        fontSize: SizeConfig.defaultSize! * 3,
                        fontWeight: FontWeight.bold),
                  ),
                  Text('Updated ${Provider.of<WeatherProvider>(context).weatherData!.date.substring(10)}' ,
                      style:
                          TextStyle(fontSize: SizeConfig.defaultSize! * 1.7)),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.network('https:${Provider.of<WeatherProvider>(context).weatherData!.image.toString()}',width: 80,),
                      Text(
                        ' ${Provider.of<WeatherProvider>(context).weatherData!.temp}',
                        style: TextStyle(
                            fontSize: SizeConfig.defaultSize! * 3,
                            fontWeight: FontWeight.bold),
                      ),
                      Column(
                        children:  [
                          Text('maxTemp : ${Provider.of<WeatherProvider>(context).weatherData!.maxTemp}'),
                          Text('minTemp : ${Provider.of<WeatherProvider>(context).weatherData!.minTemp}')
                        ],
                      )
                    ],
                  ),
                  const Spacer(),
                  Text(
                    ' ${Provider.of<WeatherProvider>(context).weatherData!.weatherStateName}',
                    style: TextStyle(
                        fontSize: SizeConfig.defaultSize! * 3,
                        fontWeight: FontWeight.bold),
                  ),
                  const Spacer(
                    flex: 5,
                  )
                ],
              ),
            ),
    );
  }
}
