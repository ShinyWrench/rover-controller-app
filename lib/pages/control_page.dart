import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:rover_controller_app/components/control_set.dart';

const PAGE_TITLE = 'Rover Command';

class ControlPage extends StatefulWidget {
  @override
  _ControlPageState createState() => _ControlPageState();
}

class _ControlPageState extends State<ControlPage> {
  bool _pairedWithRover = false;
  bool _connectedToRover = false;

  @override
  void initState() {
    super.initState();
    _searchAndConnect();
  }

  // Future<void> _searchAndConnect() async {
  //   try {
  //     List<BluetoothDevice> devices =
  //         await FlutterBluetoothSerial.instance.getBondedDevices();
  //     if(devices.map((device) => device.name).contains('Blue Rover'))
  //
  //   } on PlatformException {
  //     print("_searchAndConnect error");
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(PAGE_TITLE),
      ),
      body: Column(
        children: [
          _connectedToRover
              ? ControlSet()
              : Expanded(
                  child: Center(
                    child: Text('Waiting to pair or connect...'),
                  ),
                ),
          Expanded(
              child: Row(
            children: [],
          ))
        ],
      ),
    );
  }
}
