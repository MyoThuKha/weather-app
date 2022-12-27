import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather_app/api.dart';

//fetch data
Future<Map<String, dynamic>> getWeatherDatas(double lat, double lon) async {
  String uri =
      "https://api.open-meteo.com/v1/forecast?latitude=$lat&longitude=$lon&hourly=temperature_2m,relativehumidity_2m,precipitation,weathercode,windspeed_10m&daily=temperature_2m_max&current_weather=true&timeformat=unixtime&timezone=auto";
  http.Response data = await http.get(Uri.parse(uri));
  Map<String, dynamic> result = await jsonDecode(data.body);
  return result;
}

Future<Map<String, dynamic>> getWeatherData(String city) async {
  String location = city.toLowerCase();
  final String uri =
      "http://api.openweathermap.org/geo/1.0/direct?q=$location&limit=1&appid=$API_KEY";
  http.Response weatherdata = await http.get(Uri.parse(uri));
  Map<String, dynamic> data = await jsonDecode(weatherdata.body)[0];
  Map<String, dynamic> result = await getWeatherDatas(data['lat'], data['lon']);

  return result;
}
