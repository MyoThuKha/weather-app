import 'package:flutter/material.dart';
import 'package:weather_app/components/info_item.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  // final String cityShort = "nyc".toUpperCase();
  // final String city = "New York";
  final String humidity = "34%";
  final String wind = "2";
  final String visible = "10";

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.width;
    Map<String, String> routeData =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;

    String temperature = routeData["temp"]!;
    String city = routeData["city"]!;
    String cityShort = routeData["short"]!.toUpperCase();

    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "$temperature\u00B0",
                style: const TextStyle(fontSize: 180),
              ),
              Text(
                cityShort,
                style: const TextStyle(fontSize: 120),
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

              //Bottom Bar
              Padding(
                padding: const EdgeInsets.all(12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                        padding: const EdgeInsets.all(14),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.grey,
                        ),
                        child: const Icon(Icons.arrow_back_rounded)),
                    Text(
                      city,
                      style: const TextStyle(fontSize: 16),
                    ),
                    Container(
                        padding: const EdgeInsets.all(14),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.grey,
                        ),
                        child: const Icon(Icons.arrow_forward_rounded)),
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
