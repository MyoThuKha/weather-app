import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:weather_app/components/grid_item.dart';
import 'package:intl/intl.dart';
// import 'dart:convert';
// import '../api.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  //fetch data
  Future<Map<String, dynamic>> getWeatherDatas(double lat, double lon) async {
    String uri =
        "https://api.open-meteo.com/v1/forecast?latitude=$lat&longitude=$lon&hourly=temperature_2m,relativehumidity_2m,precipitation,weathercode,windspeed_10m&daily=temperature_2m_max&current_weather=true&timeformat=unixtime&timezone=auto";
    http.Response data = await http.get(Uri.parse(uri));
    Map<String, dynamic> result = await jsonDecode(data.body);
    return result;
  }

  String todayDate() {
    DateTime now = DateTime.now();
    String dateText = DateFormat("EEEE, MMM d").format(now);
    return dateText;
  }

  @override
  Widget build(BuildContext context) {
    print(getWeatherDatas(37.77, -122.42));
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            //App Bar
            SizedBox(
              height: 80,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("Today"),
                          Text(todayDate()),
                        ],
                      ),
                      //time
                      //Home text
                      const Text("Hello"),
                    ]),
              ),
            ),

            //Silver Grid View(items)
            GridView(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 203 / 316,
              ),
              children: const [
                GridItem(
                  temperature: "38",
                  city: "New York",
                  cityShort: "nyc",
                ),
                GridItem(
                  temperature: "28",
                  city: "San Franciso",
                  cityShort: "sfo",
                ),
                GridItem(
                  temperature: "21",
                  city: "London",
                  cityShort: "lon",
                ),
                GridItem(
                  temperature: "37",
                  city: "Dubai",
                  cityShort: "dub",
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
