import 'package:agro_controller_app/widgets/simpleChart/simple_chart.dart';
import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart';

class Stats extends StatefulWidget {
  @override
  _StatsState createState() => _StatsState();
}

class _StatsState extends State<Stats> {
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
              'Status: ${serverData == null ? "" : serverData}.',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Status: ${webSocketCommunication('wheat')}.',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Status: ${webSocketCommunication('oil')}.',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            // Center(child: SimpleLineChart.withSampleData()),
          ],
        ),
      ),
    );
  }
}
