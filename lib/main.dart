import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:rover_controller_app/pages/bluetooth_off_page.dart';
import 'package:rover_controller_app/pages/control_page.dart';
import 'package:rover_controller_app/constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: kAppName,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FutureBuilder<BluetoothState>(
          future: FlutterBluetoothSerial.instance.state,
          builder: (c, snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data == BluetoothState.STATE_ON) {
                return ControlPage();
              } else {
                return BluetoothOffPage(state: snapshot.data);
              }
            } else if (snapshot.hasError) {
              print("Bluetooth error");
              return BluetoothOffPage(state: BluetoothState.UNKNOWN);
            } else {
              return Scaffold(
                body: Center(
                  child: Text('Please wait'),
                ),
              );
            }
          }),
    );
  }
}

        // snapshot.data == BluetoothState.STATE_ON
