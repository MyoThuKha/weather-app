import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/components/chart_page.dart';
import 'package:weather_app/components/info_item.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/data/cities.dart';
import 'package:weather_app/data/fetch_data.dart';
import 'package:weather_app/data/weather.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  // final String cityShort = "nyc".toUpperCase();
  final String visible = "10";

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.width;
    Map<String, dynamic> routeData =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    int index = routeData["index"];
    String city = routeData["city"]!;
    String cityShort = routeData["short"]!.toUpperCase();

    Map dataList = context.read<WeatherModal>().weatherData;
    final String temperature =
        dataList[city]["current_weather"]["temperature"].toStringAsFixed(0);
    final String wind =
        dataList[city]["current_weather"]["windspeed"].toString();
    final String humidity =
        calculateAverage(dataList[city]["hourly"]["relativehumidity_2m"]);
    final String rain = calculateAverage(dataList[city]["hourly"]["rain"]);

    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: height,

          // body
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Image.asset("assets/Sunny.png", height: 200),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 60),
                              child: Text(
                                "$temperature\u00B0",
                                style: const TextStyle(fontSize: 198),
                              ),
                            ),
                            Text(
                              cityShort,
                              style: const TextStyle(fontSize: 140),
                            ),
                          ],
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InfoItem(
                          text: "$humidity%",
                          icon: Icons.water_drop,
                        ),
                        InfoItem(
                          text: "${wind}KM/H",
                          icon: Icons.air_rounded,
                        ),
                        InfoItem(
                          text: "${rain}MM",
                          // icon: Icons.device_thermostat_rounded,
                          icon: CupertinoIcons.cloud_rain_fill,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              ChartPage(
                  weeklyDatas: dataList[city]["daily"]["temperature_2m_max"]),

              //Bottom Bar
              Padding(
                padding: const EdgeInsets.all(12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        int nextIndex =
                            index == 0 ? (cities.length - 1) : index - 1;
                        Navigator.pushReplacementNamed(context, '/detail',
                            arguments: {
                              "index": nextIndex,
                              "city": cities[nextIndex]["city"],
                              "short": cities[nextIndex]["short"],
                            });
                      },
                      child: Container(
                        padding: const EdgeInsets.all(22),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.grey,
                        ),
                        child: const Icon(
                          CupertinoIcons.arrow_left_to_line,
                          size: 18,
                        ),
                      ),
                    ),
                    Text(
                      city,
                      style: const TextStyle(fontSize: 16),
                    ),
                    GestureDetector(
                      onTap: () {
                        final int nextIndex =
                            (index == cities.length - 1) ? 0 : index + 1;
                        Navigator.pushReplacementNamed(context, '/detail',
                            arguments: {
                              "index": nextIndex,
                              "city": cities[nextIndex]["city"],
                              "short": cities[nextIndex]["short"],
                            });
                      },
                      child: Container(
                          padding: const EdgeInsets.all(22),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.grey,
                          ),
                          child: const Icon(
                            CupertinoIcons.arrow_right_to_line,
                            size: 18,
                          )),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
