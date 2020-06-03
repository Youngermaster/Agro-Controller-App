import 'package:agro_controller_app/widgets/simpleChart/simple_chart.dart';
import 'package:flutter/material.dart';

class WheatChartView extends StatefulWidget {
  @override
  _WheatChartViewState createState() => _WheatChartViewState();
}

class _WheatChartViewState extends State<WheatChartView> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Scaffold(
      appBar: AppBar(
        title: Text('Wheat Chart'),
        centerTitle: true,
      ),
      body: Center(
        child: SimpleLineChart.withRandomData(),
      ),
    ));
  }
}
