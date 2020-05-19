import 'package:agro_controller_app/views/motor/motor_view.dart';
import 'package:flutter/material.dart';

class ControllerView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Main Controllers'),
              Row(
                children: [
                  RaisedButton(
                    child: Text('Open route'),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MotorView()),
                      );
                    },
                  ),
                  FlatButton(
                    onPressed: () => print("Stuff"),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 60, vertical: 15),
                      child: Text(
                        'title',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w800,
                          color: Colors.white,
                        ),
                      ),
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 31, 229, 146),
                          borderRadius: BorderRadius.circular(5)),
                    ),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
