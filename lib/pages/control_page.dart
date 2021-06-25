import 'package:flutter/material.dart';
import 'package:rover_controller_app/components/control_set.dart';
import 'package:rover_controller_app/services/command_sender.dart';

const PAGE_TITLE = 'Rover Command';

// TODO: Use https://pub.dev/packages/simple_logger package
//       Use it instead of print
//       Use it to log connectionLog

class ControlPage extends StatefulWidget {
  @override
  _ControlPageState createState() => _ControlPageState();
}

class _ControlPageState extends State<ControlPage> {
  final CommandSender _commandSender = CommandSender();
  bool _connected = false;
  String _connectionStatus = 'Connecting...';

  @override
  void initState() {
    super.initState();
    _connectToRover();
  }

  Future<void> _connectToRover() async {
    String connectionLog = '';
    int triesLeft = 3;
    while (triesLeft-- > 0) {
      connectionLog += await _commandSender.connect();
      if (_commandSender.isConnected() == true) {
        setState(() => _connected = true);
        return;
      } else {
        setState(() => _connectionStatus = 'Retrying...');
      }
    }
    setState(() => _connectionStatus = connectionLog);
    print(connectionLog);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(PAGE_TITLE),
      ),
      body: Column(
        children: [
          _connected
              ? ControlSet(commandSender: _commandSender)
              : Expanded(
                  child: Center(
                    child: Text(_connectionStatus),
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
