import 'package:flutter/material.dart';
import 'package:rover_controller_app/components/control_set.dart';
import 'package:rover_controller_app/services/command_sender.dart';

const PAGE_TITLE = 'Rover Command';

class ControlPage extends StatefulWidget {
  @override
  _ControlPageState createState() => _ControlPageState();
}

class _ControlPageState extends State<ControlPage> {
  final CommandSender _commandSender = CommandSender();

  @override
  void initState() {
    super.initState();
    _commandSender.connect();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(PAGE_TITLE),
      ),
      body: Column(
        children: [
          _commandSender.isConnected()
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
