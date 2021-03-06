import 'package:agro_controller_app/utils/webSocketConnection.dart';
import 'package:flutter/material.dart';

class TankView extends StatefulWidget {
  @override
  _TankViewState createState() => _TankViewState();
}

class _TankViewState extends State<TankView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Hay Tank Controller'),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                'Tank View',
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
                        WebSocketConnection.webSocketCommunication('empty');
                        print("Empty tank");
                      },
                      icon: Icon(Icons.vertical_align_bottom),
                      color: Colors.green,
                      label: Text("Empty tank"),
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
