import 'package:flutter/material.dart';
import 'package:weather_app/components/grid_item.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  //fetch data
  void getWeatherDatas() {}

  //temporary data
  void getDate() {
    DateTime now = DateTime.now();
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
                        children: const [
                          Text("Today"),
                          Text("Thursday Oct 8"),
                        ],
                      ),
                      //time
                      //Home text
                      const Text("Home"),
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
