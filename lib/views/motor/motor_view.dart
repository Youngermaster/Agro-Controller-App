import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart';

class MotorView extends StatefulWidget {
  @override
  _MotorViewState createState() => _MotorViewState();
}

class _MotorViewState extends State<MotorView> {
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
                        webSocketCommunication('speedup');
                        print("Accelarate");
                      },
                      icon: Icon(Icons.arrow_upward),
                      color: Colors.green,
                      label: Text("Accelerate"),
                      textColor: Colors.white,
                    ),
                    RaisedButton.icon(
                      onPressed: () {
                        webSocketCommunication('brake');
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
