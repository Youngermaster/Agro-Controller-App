import 'package:socket_io_client/socket_io_client.dart';

class WebSocketConnection {
  static String serverStatus = "";
  static var tractorOil;
  static var tractorWheat;
  static String urlConnection;
  static Socket socket = io(urlConnection, <String, dynamic>{
    'transports': ['websocket'],
    'autoConnect': false,
  });

  static asignConnection(String connection) {
    urlConnection = connection;
  }

  static webSocketConnection() {
    socket.connect();
    socket.on('connect', (_) {
      print('connected');
      socket.emit('setclient', 'flutterApp');
    });

    socket.on('oil', (data) {
      tractorOil = data;
      print("oil -> $data");
    });
    socket.on('wheat', (data) {
      tractorWheat = data;
      print("wheat -> $data");
    });
    socket.on('status', (data) {
      serverStatus = data;
      print(data);
    });
    
    socket.on('event', (data) => print(data));
    socket.on('disconnect', (_) => print('disconnect'));
    socket.on('fromServer', (_) => print(_));
  }

  static webSocketCommunication(String event) {
    socket.emit(event);
  }
}
