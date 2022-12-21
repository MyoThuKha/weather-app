import 'package:flutter/material.dart';
import 'package:weather_app/pages/detail_page.dart';

class GridItem extends StatelessWidget {
  const GridItem({super.key});

  final String temperature = "38";
  final String cityShort = "nyc";
  final String city = "New York";

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, "detail");
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(width: 0.5, color: Colors.grey[400]!),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "$temperature°",
                style: const TextStyle(
                  fontSize: 80,
                ),
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
          ),
        ),
      ),
    );
  }
}
