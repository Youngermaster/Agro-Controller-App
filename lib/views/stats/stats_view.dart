import 'package:agro_controller_app/utils/webSocketConnection.dart';
import 'package:agro_controller_app/views/stats/oil/oil_stats_view.dart';
import 'package:agro_controller_app/views/stats/wheat/wheat_stats_view.dart';
import 'package:agro_controller_app/widgets/cardSection/card_section.dart';
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
            Text(
              "Status: ${WebSocketConnection.serverStatus == null ? "" : WebSocketConnection.serverStatus}.",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            CardSection(OilStatsView(), 'Oil stats'),
            CardSection(WheatStatsView(), 'Wheat stats'),
          ],
        ),
      ),
    );
  }
}
