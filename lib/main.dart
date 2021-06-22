import 'package:flutter/material.dart';
import 'package:rover_controller_app/pages/control_page.dart';

const APP_NAME = 'Rover Controller';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp() {
    // TODO: Do Bluetooth init here
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: APP_NAME,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // TODO: use StreamBuilder here like in flutter_blue example
      home: ControlPage(),
    );
  }
}
