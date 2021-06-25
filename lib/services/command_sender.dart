import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'dart:typed_data';
import 'dart:async';
import 'dart:convert' show ascii;
import 'package:rover_controller_app/constants.dart';

class CommandSender {
  CommandSender() {
    Timer.periodic(Duration(milliseconds: 50), _sendTask);
  }

  final String roverBluetoothName = 'Blue Rover';

  BluetoothDevice? _roverDevice;
  BluetoothConnection? _roverConnection;

  RoverCommand _command = RoverCommand.stop;

  bool isConnected() {
    try {
      return _roverConnection!.isConnected;
    } catch (error) {}
    return false;
  }

  Future<String> connect() async {
    try {
      List<BluetoothDevice> devices =
          await FlutterBluetoothSerial.instance.getBondedDevices();
      if (devices.map((device) => device.name).contains(roverBluetoothName) ==
          false) {
        return 'Not paired with $roverBluetoothName';
      }
      _roverDevice =
          devices.where((device) => device.name == roverBluetoothName).first;
      _roverConnection =
          await BluetoothConnection.toAddress(_roverDevice!.address);
      _roverConnection!.input.listen((Uint8List data) {
        // print(ascii.decode(data));
      });
      return 'Connected to Blue Rover.';
    } catch (error) {
      return error.toString();
    }
  }

  void send(RoverCommand command) {
    _command = command;
    print('send($command)');
  }

  void _sendTask(timer) async {
    if (isConnected()) {
      int trim = 15;
      final int commandData = (trim << 3) + _command.index;
      try {
        _roverConnection!.output.add(Uint8List.fromList([commandData]));
      } catch (error) {
        print('connection output.add$error');
      }
    }
  }
}
