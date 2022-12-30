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
  String today() {
    DateTime now = DateTime.now();
    String dateText = DateFormat("EEE").format(now);
    return dateText;
  }

  @override
  Widget build(BuildContext context) {
    final List weekly = widget.weeklyDatas;
    final double highest =
        weekly.reduce((curr, next) => curr > next ? curr : next);
    final double lowest =
        weekly.reduce((curr, next) => curr < next ? curr : next);
    return AspectRatio(
      aspectRatio: 3 / 1,
      child: LineChart(
        LineChartData(
          borderData: FlBorderData(show: false),
          gridData: FlGridData(show: false),
          minX: 0,
          minY: lowest,
          maxX: 8,
          maxY: highest,

          //chart data
          lineBarsData: [
            LineChartBarData(
              barWidth: 2,
              isCurved: true,
              isStrokeCapRound: true,
              color: Colors.grey[800],
              dotData: FlDotData(
                show: true,
                // checkToShowDot: (spot, barData) => spot == barData.spots[1],
              ),
              belowBarData: BarAreaData(
                show: true,
                color: Colors.grey[300],
              ),
              spots: [
                FlSpot(0, weekly[0]),
                FlSpot(1, weekly[0]),
                FlSpot(2, weekly[1]),
                FlSpot(3, weekly[2]),
                FlSpot(4, weekly[3]),
                FlSpot(5, weekly[4]),
                FlSpot(6, weekly[5]),
                FlSpot(7, weekly[6]),
                FlSpot(8, weekly[6]),
              ],
            ),
          ],

          //title
          titlesData: FlTitlesData(
            show: true,
            topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 30,
                interval: 1,
                getTitlesWidget: bottomTitleWidgets,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    List<String> days = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"];
    List<String> items = [today()];

    for (int i = 1; i < days.length; i++) {
      int nextDay = days.indexOf(today()) + i;
      if (nextDay >= days.length) nextDay -= days.length;
      items.add(days[nextDay]);
    }
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
