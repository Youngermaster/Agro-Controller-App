import 'package:agro_controller_app/views/home/home_view.dart';
import 'package:agro_controller_app/widgets/appWidth/appWidth.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AppWidth.width = 21;
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.green,
        textTheme: Theme.of(context).textTheme.apply(
              fontFamily: 'Open Sans',
            ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomeView(),
    );
  }
}
