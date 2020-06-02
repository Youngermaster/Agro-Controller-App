import 'package:agro_controller_app/utils/webSocketConnection.dart';
import 'package:flutter/material.dart';

class MotorView extends StatefulWidget {
  @override
  _MotorViewState createState() => _MotorViewState();
}

class _MotorViewState extends State<MotorView> {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Motor Controller'),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                'Motor View',
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
                        WebSocketConnection.webSocketCommunication('speedup');
                        print("Accelarate");
                      },
                      icon: Icon(Icons.arrow_upward),
                      color: Colors.green,
                      label: Text("Accelerate"),
                      textColor: Colors.white,
                    ),
                    RaisedButton.icon(
                      onPressed: () {
                        WebSocketConnection.webSocketCommunication('brake');
                        print("Brake");
                      },
                      icon: Icon(Icons.pause),
                      color: Colors.green,
                      label: Text("Brake"),
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
