import 'package:flutter/cupertino.dart';

class WeatherModal extends ChangeNotifier {
  Map weatherData = {};

  void addData(Map data, String city) {
    weatherData[city] = data;
  }
}
