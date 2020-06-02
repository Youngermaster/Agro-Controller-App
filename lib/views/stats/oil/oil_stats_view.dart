import 'package:agro_controller_app/utils/webSocketConnection.dart';
import 'package:flutter/material.dart';

class OilStatsView extends StatefulWidget {
  @override
  _OilStatsViewState createState() => _OilStatsViewState();
}

class _OilStatsViewState extends State<OilStatsView> {
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
              Center(
                child: RaisedButton.icon(
                  onPressed: () {
                    WebSocketConnection.webSocketCommunication('speedup');
                    print("Get Oil data");
                  },
                  icon: Icon(Icons.cloud_download),
                  color: Colors.green,
                  label: Text("Get oil data"),
                  textColor: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
