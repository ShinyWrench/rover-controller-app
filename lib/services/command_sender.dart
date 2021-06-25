import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'dart:typed_data';
import 'dart:convert' show ascii;

class CommandSender {
  CommandSender() {
    // TODO: Start timed task for writing _command to bluetooth
  }

  final String roverBluetoothName = 'Blue Rover';

  BluetoothDevice? _roverDevice;
  BluetoothConnection? _roverConnection;

  int _command = 0;

  bool isConnected() {
    return _roverConnection != null;
  }

  Future<void> connect() async {
    try {
      List<BluetoothDevice> devices =
          await FlutterBluetoothSerial.instance.getBondedDevices();
      if (devices.map((device) => device.name).contains(roverBluetoothName) ==
          false) {
        print("Not paired with Blue Rover");
        return;
      }
      _roverDevice =
          devices.where((device) => device.name == roverBluetoothName).first;
      _roverConnection =
          await BluetoothConnection.toAddress(_roverDevice!.address);
      _roverConnection!.input.listen((Uint8List data) {
        print(ascii.decode(data));
      });
    } catch (error) {
      print('_searchAndConnect error: $error');
    }
  }

  void move(int direction) {
    print('move($direction)');
    if (direction == 1) {
      _command = 1;
    } else if (direction == -1) {
      // TODO: _command = ...
    } else {
      // TODO: _command = ...
    }
  }

  void turn(int direction) {
    print('turn($direction)');
    // TODO
  }
}
