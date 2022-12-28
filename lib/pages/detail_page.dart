import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/components/info_item.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/data/weather.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  // final String cityShort = "nyc".toUpperCase();
  final String humidity = "34%";
  final String wind = "2";
  final String visible = "10";

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.width;
    Map<String, dynamic> routeData =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    String city = routeData["city"]!;
    String cityShort = routeData["short"]!.toUpperCase();

    Map dataList = context.read<WeatherModal>().weatherData;

    final String temperature =
        dataList[city]["current_weather"]["temperature"].toString();

    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: height,

          // body
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
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
                            child: FittedBox(
                              child: Text(
                                "$temperature\u00B0",
                                style: const TextStyle(fontSize: 180),
                              ),
                            ),
                          ),
                          Text(
                            cityShort,
                            style: const TextStyle(fontSize: 120),
                          ),
                        ],
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      InfoItem(
                        text: "54%",
                        icon: Icons.water_drop,
                      ),
                      InfoItem(
                        text: "5KM/H",
                        icon: Icons.air_rounded,
                      ),
                      InfoItem(
                        text: "30%",
                        icon: Icons.device_thermostat_rounded,
                      ),
                    ],
                  ),
                ],
              ),

              //Bottom Bar
              Padding(
                padding: const EdgeInsets.all(12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
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
                    Text(
                      city,
                      style: const TextStyle(fontSize: 16),
                    ),
                    Container(
                        padding: const EdgeInsets.all(22),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.grey,
                        ),
                        child: const Icon(
                          CupertinoIcons.arrow_right_to_line,
                          size: 18,
                        )),
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
