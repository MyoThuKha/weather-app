import 'package:flutter/material.dart';
import 'package:weather_app/data/weather.dart';
import 'package:weather_app/pages/detail_page.dart';
import 'package:weather_app/pages/home_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: ((_) => WeatherModal())),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.grey,
        ),
        initialRoute: '/',
        routes: {
          "/": (context) => const HomePage(),
          "detail": (context) => const DetailPage(),
        },
        // home: const HomePage(),
      ),
    );
  }
}
