import 'package:flutter/material.dart';

class TankView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
         appBar: AppBar(
          title: Text('Hay Tank Controller'),
          centerTitle: true,
        ),
        body: Center(
          child: Text(
            'Tank View',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}