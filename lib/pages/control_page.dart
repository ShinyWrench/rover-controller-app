import 'package:flutter/material.dart';
import 'package:rover_controller_app/components/control_set.dart';
import 'package:rover_controller_app/services/command_sender.dart';
import 'package:rover_controller_app/constants.dart';
import 'package:simple_logger/simple_logger.dart';

class ControlPage extends StatefulWidget {
  @override
  _ControlPageState createState() => _ControlPageState();
}

class _ControlPageState extends State<ControlPage> {
  final CommandSender _commandSender = CommandSender();
  bool _connected = false;
  String _connectionStatus = 'Connecting...';
  String _connectionLog = '';

  final SimpleLogger _logger = SimpleLogger();

  @override
  void initState() {
    super.initState();
    _logger.setLevel(
      Level.INFO,
      includeCallerInfo: true,
    );
    _logger.onLogged = (string, info) {
      print(string);
    };
    _connectToRover();
  }

  Future<void> _connectToRover() async {
    final int numAttempts = 3;
    for (int i = 0; i < numAttempts; i++) {
      String logMessage = await _commandSender.connect();
      _connectionLog += _logger.info(logMessage).toString() + '\n\n';
      if (_commandSender.isConnected() == true) {
        setState(() => _connected = true);
        return;
      } else if (i < numAttempts - 1) {
        setState(() => _connectionStatus = 'Retrying (${i + 2}/$numAttempts)');
      }
    }
    setState(() =>
        _connectionStatus = 'Connection failed after $numAttempts tries.');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(kControlPageTitle),
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
          _connected
              ? Expanded(
                  child: Container(),
                )
              : Expanded(
                  child: SingleChildScrollView(child: Text(_connectionLog)),
                ),
        ],
      ),
    );
  }
}
