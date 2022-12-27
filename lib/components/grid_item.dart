import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather_app/api.dart';

class GridItem extends StatelessWidget {
  final String temperature;
  final String cityShort;
  final String city;

  const GridItem({
    super.key,
    required this.temperature,
    required this.cityShort,
    required this.city,
  });

  //fetch data
  Future<Map<String, dynamic>> getWeatherDatas(double lat, double lon) async {
    String uri =
        "https://api.open-meteo.com/v1/forecast?latitude=$lat&longitude=$lon&hourly=temperature_2m,relativehumidity_2m,precipitation,weathercode,windspeed_10m&daily=temperature_2m_max&current_weather=true&timeformat=unixtime&timezone=auto";
    http.Response data = await http.get(Uri.parse(uri));
    Map<String, dynamic> result = await jsonDecode(data.body);
    return result;
  }

  Future<Map<String, dynamic>> getWeatherData() async {
    String location = city.toLowerCase();
    final String uri =
        "http://api.openweathermap.org/geo/1.0/direct?q=$location&limit=1&appid=$API_KEY";
    http.Response weatherdata = await http.get(Uri.parse(uri));
    Map<String, dynamic> data = await jsonDecode(weatherdata.body)[0];
    Map<String, dynamic> result =
        await getWeatherDatas(data['lat'], data['lon']);
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, "detail", arguments: {
          "temp": temperature,
          "city": city,
          "short": cityShort,
        });
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(width: 0.5, color: Colors.grey[400]!),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: FutureBuilder(
              future: getWeatherData(),
              builder: (context, snapshot) {
                if (snapshot.connectionState != ConnectionState.done) {
                  return const Center(
                    child: Text("Loading..."),
                  );
                }
                snapshot.data;
                return Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      // "$temperature°",
                      "${snapshot.data!["current_weather"]["temperature"]}°",
                      style: const TextStyle(fontSize: 64),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          cityShort.toUpperCase(),
                          style: const TextStyle(
                            fontSize: 24,
                          ),
                        ),
                        Text(
                          city,
                          style: const TextStyle(color: Colors.grey),
                        ),
                      ],
                    )
                  ],
                );
              }),
        ),
      ),
    );
  }
}
