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
        child: Column(
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
              scrollDirection: Axis.vertical,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 203 / 316,
              ),
              children: [
                GridItem(),
                GridItem(),
                GridItem(),
                GridItem(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
