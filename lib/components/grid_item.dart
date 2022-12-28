import 'package:flutter/material.dart';
import '../data/weather.dart';
import 'package:provider/provider.dart';

class GridItem extends StatefulWidget {
  final int index;
  final String city;
  final String cityShort;

  const GridItem({
    super.key,
    required this.index,
    required this.city,
    required this.cityShort,
  });

  @override
  State<GridItem> createState() => _GridItemState();
}

class _GridItemState extends State<GridItem> {
  String temperature = "-";

  void saveData(data) {
    context.read<WeatherModal>().addData(data, widget.city);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, "detail", arguments: {
          "city": widget.city,
          "short": widget.cityShort,
        });
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(width: 0.5, color: Colors.grey[400]!),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: FutureBuilder(
              future: getWeatherData(widget.city),
              builder: (context, snapshot) {
                if (snapshot.connectionState != ConnectionState.done) {
                  return const Center(
                    child: Text("Loading..."),
                  );
                }
                //----------------
                saveData(snapshot.data!);
                temperature =
                    snapshot.data!["current_weather"]["temperature"].toString();
                // -------------------
                return Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "$temperature°",
                      // "${snapshot.data!["current_weather"]["temperature"]}°",
                      style: const TextStyle(fontSize: 64),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.cityShort.toUpperCase(),
                          style: const TextStyle(
                            fontSize: 24,
                          ),
                        ),
                        Text(
                          widget.city,
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
