import 'package:agro_controller_app/widgets/simpleChart/simple_chart.dart';
import 'package:flutter/material.dart';

class OilChartView extends StatefulWidget {
  @override
  _OilChartViewState createState() => _OilChartViewState();
}

class _OilChartViewState extends State<OilChartView> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Scaffold(
      appBar: AppBar(
        title: Text('Oil Chart'),
        centerTitle: true,
      ),
      body: Center(
        child: SimpleLineChart.withSampleData(),
      ),
    ));
  }
}
