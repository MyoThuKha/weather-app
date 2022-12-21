import 'package:flutter/material.dart';

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
                temperature,
                style: const TextStyle(fontSize: 180),
              ),
              Text(
                cityShort,
                style: const TextStyle(fontSize: 120),
              ),
              Row(),
              Text(city),
            ],
          ),
        ),
      ),
    );
  }
}
