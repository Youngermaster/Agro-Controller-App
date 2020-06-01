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
              Center(
                // child: RaisedButton(
                //   onPressed: () {
                //     Navigator.pop(context);
                //   },
                //   child: Text('Go back!'),
                //)
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    RaisedButton.icon(
                      onPressed: () => print("Turn on"),
                      icon: Icon(Icons.play_arrow),
                      color: Colors.green,
                      label: Text("Turn on"),
                      textColor: Colors.white,
                    ),
                    RaisedButton.icon(
                      onPressed: () => print("Turn off"),
                      icon: Icon(Icons.flash_off)                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           ,
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
