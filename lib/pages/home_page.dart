import 'package:flutter/material.dart';
import 'package:weather_app/components/grid_item.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/data/cities.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 203 / 316,
              ),
              itemCount: cities.length,
              itemBuilder: ((context, index) => GridItem(
                  index: index,
                  city: cities[index]["city"]!,
                  cityShort: cities[index]["short"]!)),
            ),
          ],
        ),
      ),
    );
  }
}
