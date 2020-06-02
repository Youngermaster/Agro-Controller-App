import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart';

class PloughView extends StatefulWidget {
  @override
  _PloughViewState createState() => _PloughViewState();
}

class _PloughViewState extends State<PloughView> {
  String serverData;
  Socket socket = io('http://51.15.209.191:9000', <String, dynamic>{
    'transports': ['websocket'],
    'autoConnect': false,
  });

  webSocketConnection() {
    socket.connect();
    socket.on('connect', (_) {
      print('connected');
      socket.emit('setclient', 'flutterApp');
    });
    socket.on('status', (data) {
      print(data);
      setState(() {
        serverData = data;
      });
    });
    socket.on('event', (data) => print(data));
    socket.on('disconnect', (_) => print('disconnect'));
    socket.on('fromServer', (_) => print(_));
  }

  webSocketCommunication(String event) {
    socket.emit(event);
  }

  @override
  void initState() {
    super.initState();
    webSocketConnection();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Plough Controller'),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                'Plough View',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Status: ${serverData == null ? "" : serverData}.",
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
                        webSocketCommunication('plow');
                        print("Turn on");
                      },
                      icon: Icon(Icons.play_arrow),
                      color: Colors.green,
                      label: Text("Turn on"),
                      textColor: Colors.white,
                    ),
                    RaisedButton.icon(
                      onPressed: () {
                        webSocketCommunication('plow');
                        print("Turn off");
                      },
                      icon: Icon(Icons.flash_off),
                      color: Colors.green,
                      label: Text("Turn off"),
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
