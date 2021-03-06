import 'package:agro_controller_app/views/controllers/lights/lights_view.dart';
import 'package:agro_controller_app/views/motor/motor_view.dart';
import 'package:agro_controller_app/views/plough/plough_view.dart';
import 'package:agro_controller_app/views/tank/tank_view.dart';
import 'package:agro_controller_app/widgets/cardSection/card_section.dart';
import 'package:flutter/material.dart';

class ControllerView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CardSection(MotorView(), 'Motor Controller'),
            CardSection(PloughView(), 'Plough Controller'),
            CardSection(TankView(), 'Tank Controller'),
            CardSection(LightView(), 'Lights Controller'),
          ],
        ),
      ),
    );
  }
}
