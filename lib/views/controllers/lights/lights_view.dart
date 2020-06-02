import 'package:agro_controller_app/utils/webSocketConnection.dart';
import 'package:flutter/material.dart';

class LightView extends StatefulWidget {
  @override
  _LightViewState createState() => _LightViewState();
}

class _LightViewState extends State<LightView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Light Controller'),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                'Light View',
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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    RaisedButton.icon(
                      onPressed: () {
                        WebSocketConnection.webSocketCommunication(
                          'frontlights',
                        );
                        print("Front lights");
                      },
                      icon: Icon(Icons.arrow_upward),
                      color: Colors.green,
                      label: Text("Front lights"),
                      textColor: Colors.white,
                    ),
                    RaisedButton.icon(
                      onPressed: () {
                        WebSocketConnection.webSocketCommunication(
                          'backlights',
                        );
                        print("Back lights");
                      },
                      icon: Icon(Icons.pause),
                      color: Colors.green,
                      label: Text("Back lights"),
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
