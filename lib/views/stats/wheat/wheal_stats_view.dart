import 'package:agro_controller_app/utils/webSocketConnection.dart';
import 'package:flutter/material.dart';

class WheatStatsView extends StatefulWidget {
  @override
  _WheatStatsViewState createState() => _WheatStatsViewState();
}

class _WheatStatsViewState extends State<WheatStatsView> {
  var tractorWheat;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Wheat Stats'),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                'Wheat Stats',
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
                "Wheat: ${tractorWheat == null ? "Unknown" : tractorWheat}%",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Center(
                child: RaisedButton.icon(
                  onPressed: () {
                    WebSocketConnection.webSocketCommunication('wheat');
                    Future.delayed(const Duration(seconds: 5), () {
                      setState(() {
                        tractorWheat = WebSocketConnection.tractorWheat;
                      });
                    });
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
