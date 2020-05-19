import 'package:flutter/material.dart';

class PloughView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
         appBar: AppBar(
          title: Text('Plough Controller'),
          centerTitle: true,
        ),
        body: Center(
          child: Text(
            'Plough View',
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
