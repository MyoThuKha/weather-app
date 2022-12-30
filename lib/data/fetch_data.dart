import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather_app/api.dart';

//fetch data
// "https://api.open-meteo.com/v1/forecast?latitude=$lat&longitude=$lon&hourly=temperature_2m,relativehumidity_2m,precipitation,weathercode,windspeed_10m&daily=temperature_2m_max&current_weather=true&timeformat=unixtime&timezone=auto";
Future<Map<String, dynamic>> getWeatherDatas(double lat, double lon) async {
  String uri =
      "https://api.open-meteo.com/v1/forecast?latitude=$lat&longitude=$lon&hourly=relativehumidity_2m&daily=temperature_2m_max,rain_sum&current_weather=true&timezone=auto";
  http.Response data = await http.get(Uri.parse(uri));
  Map<String, dynamic> result = await jsonDecode(data.body);
  return result;
}

Future<Map<String, dynamic>> getWeatherData(String city) async {
  String location = city.toLowerCase();
  final String uri =
      "https://geocoding-api.open-meteo.com/v1/search?name=$location&count=1";
  http.Response weatherdata = await http.get(Uri.parse(uri));
  Map<String, dynamic> data = await jsonDecode(weatherdata.body);
  data = data["results"][0];

  Map<String, dynamic> result =
      await getWeatherDatas(data['latitude'], data['longitude']);
  return result;
}

String calculateAverage(List valueList) {
  double total = 0;
  for (int i = 0; i < valueList.length; i++) {
    total += valueList[i];
  }
  return (total / valueList.length).toStringAsFixed(0);
}
