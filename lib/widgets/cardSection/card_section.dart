import 'package:flutter/material.dart';

class CardSection extends StatefulWidget {
  Widget newRoute;
  String title;
  CardSection(this.newRoute, this.title);

  @override
  _CardSectionState createState() => _CardSectionState();
}

class _CardSectionState extends State<CardSection> {
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => widget.newRoute),
        );
      },
      child: Container(
        width: MediaQuery.of(context).size.width * 0.9,
        padding: const EdgeInsets.symmetric(
          horizontal: 60,
          vertical: 45,
        ),
        child: Text(
          widget.title,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w800,
            color: Colors.white,
          ),
        ),
        decoration: BoxDecoration(
          // color: Color.fromARGB(255, 31, 229, 146),
          color: Colors.green,
          borderRadius: BorderRadius.circular(5),
          boxShadow: [BoxShadow(blurRadius: 7.0, color: Colors.black)],
        ),
      ),
    );
  }
}
