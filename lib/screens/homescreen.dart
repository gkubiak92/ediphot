import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            height: 300,
          ),
          Expanded(
            child: Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            Container(
                              width: 50,
                              height: 80,
                              color: Colors.red,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                        Column(
                          children: <Widget>[
                            Container(
                              width: 50,
                              height: 80,
                              color: Colors.red,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            Container(
                              width: 50,
                              height: 80,
                              color: Colors.red,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                        Column(
                          children: <Widget>[
                            Container(
                              width: 50,
                              height: 80,
                              color: Colors.red,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                )),
          )
        ],
      ),
    );
  }
}
