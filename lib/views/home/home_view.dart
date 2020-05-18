import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('AgroController'),
          centerTitle: true,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Main Controllers'),
                Row(
                  children: [
                    FlatButton(
                      onPressed: null,
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
      ),
    );
  }
}
