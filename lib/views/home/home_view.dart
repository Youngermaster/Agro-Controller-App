import 'package:agro_controller_app/utils/webSocketConnection.dart';
import 'package:agro_controller_app/views/controllers/controllers_view.dart';
import 'package:agro_controller_app/views/stats/stats_view.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _pageIndex = 0;

  final ControllerView _controllerPage = ControllerView();
  final Stats _statsPage = Stats();

  Widget _showPage = ControllerView();

  _pageChooser(int pageIndex) {
    switch (pageIndex) {
      case 0:
        return _controllerPage;
        break;
      case 1:
        return _statsPage;
        break;
      case 2:
        return _controllerPage;
        break;
      default:
    }
  }

  @override
  void initState() { 
    super.initState();
    WebSocketConnection.asignConnection('http://51.15.209.191:9000');
    WebSocketConnection.webSocketConnection();
  }

  GlobalKey _bottomNavigationKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
          appBar: AppBar(
            title: Text('AgroController'),
            centerTitle: true,
          ),
          bottomNavigationBar: CurvedNavigationBar(
            key: _bottomNavigationKey,
            index: _pageIndex,
            height: 50.0,
            items: <Widget>[
              Icon(
                Icons.gamepad,
                size: 30,
                color: Colors.white,
              ),
              Icon(
                Icons.timeline,
                size: 30,
                color: Colors.white,
              ),
            ],
            color: Colors.green,
            buttonBackgroundColor: Colors.green,
            backgroundColor: Colors.white,
            animationCurve: Curves.easeInOut,
            animationDuration: Duration(milliseconds: 350),

            onTap: (index) {
              setState(() {
                _showPage = _pageChooser(index);
              });
            },
          ),
          body: Container(
            child: Center(
              child: _showPage,
            ),
          )),
    );
  }
}
