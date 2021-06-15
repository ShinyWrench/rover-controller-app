import 'package:flutter/material.dart';

const APP_NAME = 'Rover Command';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: APP_NAME,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text(APP_NAME),
        ),
        body: Column(
          children: [
            Expanded(
              child: Column(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        ControlButton(color: null),
                        ControlButton(color: Colors.orange),
                        ControlButton(color: null),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        ControlButton(color: Colors.orange),
                        ControlButton(color: null),
                        ControlButton(color: Colors.orange),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        ControlButton(color: null),
                        ControlButton(color: Colors.orange),
                        ControlButton(color: null),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
                child: Row(
              children: [],
            ))
          ],
        ),
      ),
    );
  }
}

class ControlButton extends StatelessWidget {
  ControlButton({this.color});

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextButton(
        child: Container(
          color: color,
        ),
        onPressed: () {},
      ),
    );
  }
}
