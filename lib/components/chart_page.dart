import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ChartPage extends StatefulWidget {
  final List weeklyDatas;
  const ChartPage({super.key, required this.weeklyDatas});

  @override
  State<ChartPage> createState() => _ChartPageState();
}

class _ChartPageState extends State<ChartPage> {
  List<Color> gradientColors = [
    const Color(0xff23b6e6),
    const Color(0xff02d39a),
  ];

  // bool showAvg = false;

  String today() {
    DateTime now = DateTime.now();
    String dateText = DateFormat("EEE").format(now);
    return dateText;
  }

  @override
  Widget build(BuildContext context) {
    final List weekly = widget.weeklyDatas;
    final double largest =
        weekly.reduce((curr, next) => curr > next ? curr : next);
    return AspectRatio(
      aspectRatio: 3 / 1,
      child: LineChart(LineChartData(
        gridData: FlGridData(show: false),
        titlesData: FlTitlesData(
          show: true,
          topTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          rightTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: false,
            ),
          ),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 30,
              interval: 1,
              getTitlesWidget: bottomTitleWidgets,
            ),
          ),
        ),
        borderData: FlBorderData(show: false),
        minX: 0,
        minY: 0,
        // maxX: 6,
        maxX: 8,
        maxY: largest,
        lineBarsData: [
          LineChartBarData(
            color: Colors.grey[800],
            spots: [
              FlSpot(0, weekly[6]),
              FlSpot(1, weekly[0]),
              FlSpot(2, weekly[1]),
              FlSpot(3, weekly[2]),
              FlSpot(4, weekly[3]),
              FlSpot(5, weekly[4]),
              FlSpot(6, weekly[5]),
              FlSpot(7, weekly[6]),
              FlSpot(8, weekly[0]),
            ],
            isCurved: true,
            // gradient: LinearGradient(
            //   colors: gradientColors,
            // ),
            barWidth: 2,
            isStrokeCapRound: true,
            dotData: FlDotData(
              show: false,
            ),
            belowBarData: BarAreaData(
              show: false,
              gradient: LinearGradient(
                colors: gradientColors
                    .map((color) => color.withOpacity(0.3))
                    .toList(),
              ),
            ),
          ),
        ],
      )),
    );
  }

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    // print(value.toInt());
    List<String> items = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"];
    items.insert(0, "");
    items.add("");
    String day = items[value.toInt()];

    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: Text(
        day,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
    );
  }
}
