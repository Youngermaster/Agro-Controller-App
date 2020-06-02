import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart';

class TankView extends StatefulWidget {
  @override
  _TankViewState createState() => _TankViewState();
}

class _TankViewState extends State<TankView> {
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
                        webSocketCommunication('empty');
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
