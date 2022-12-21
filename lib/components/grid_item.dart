import 'package:flutter/material.dart';

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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FittedBox(
                child: Text(
                  "$temperature°",
                  style: const TextStyle(fontSize: 100),
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
