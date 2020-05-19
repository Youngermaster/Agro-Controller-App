import 'package:agro_controller_app/widgets/simpleChart/simple_chart.dart';
import 'package:flutter/material.dart';

class Stats extends StatefulWidget {
  @override
  _StatsState createState() => _StatsState();
}

class _StatsState extends State<Stats> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Center(
              child: Text(
                'Stats View',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            // Center(child: SimpleLineChart.withSampleData()),
          ],
        ),
      ),
    );
  }
}
