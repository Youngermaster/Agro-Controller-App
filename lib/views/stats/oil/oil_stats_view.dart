import 'package:agro_controller_app/utils/webSocketConnection.dart';
import 'package:agro_controller_app/views/stats/oil/oil_chart_view.dart';
import 'package:flutter/material.dart';

class OilStatsView extends StatefulWidget {
  @override
  _OilStatsViewState createState() => _OilStatsViewState();
}

class _OilStatsViewState extends State<OilStatsView> {
  var tractorOil;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Oil Stats'),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                'Oil Stats',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Status: ${WebSocketConnection.serverStatus == null ? "" : WebSocketConnection.serverStatus}.",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Oil: ${tractorOil == null ? "Unknown" : tractorOil}%",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RaisedButton.icon(
                      onPressed: () {
                        WebSocketConnection.webSocketCommunication('oil');
                        Future.delayed(const Duration(seconds: 5), () {
                          setState(() {
                            tractorOil = WebSocketConnection.tractorOil;
                          });
                        });
                      },
                      icon: Icon(Icons.cloud_download),
                      color: Colors.green,
                      label: Text("Get oil data"),
                      textColor: Colors.white,
                    ),
                    RaisedButton.icon(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => OilChartView()),
                        );
                      },
                      icon: Icon(Icons.show_chart),
                      color: Colors.green,
                      label: Text("See chart"),
                      textColor: Colors.white,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
