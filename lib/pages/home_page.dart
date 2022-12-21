import 'package:flutter/material.dart';
import 'package:weather_app/components/grid_item.dart';
import 'package:intl/intl.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  //fetch data
  void getWeatherDatas() {}

  //temporary data
  String todayDate() {
    DateTime now = DateTime.now();
    String dateText = DateFormat("EEEE, MMM d").format(now);
    return dateText;
  }

  @override
  Widget build(BuildContext context) {
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
