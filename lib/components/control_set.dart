import 'package:flutter/material.dart';
import 'package:rover_controller_app/services/command_sender.dart';
import 'package:rover_controller_app/constants.dart';

class ControlSet extends StatelessWidget {
  ControlSet({required commandSender}) : this._commandSender = commandSender;
  final CommandSender _commandSender;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                ControlButton(),
                ControlButton(
                  color: Colors.orange,
                  onPressed: () => _commandSender.send(RoverCommand.forward),
                ),
                ControlButton(color: null),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                ControlButton(
                  color: Colors.orange,
                  onPressed: () => _commandSender.send(RoverCommand.left),
                ),
                ControlButton(
                  color: Colors.orange,
                  onPressed: () => _commandSender.send(RoverCommand.stop),
                ),
                ControlButton(
                  color: Colors.orange,
                  onPressed: () => _commandSender.send(RoverCommand.right),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                ControlButton(),
                ControlButton(
                  color: Colors.orange,
                  onPressed: () => _commandSender.send(RoverCommand.reverse),
                ),
                ControlButton(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ControlButton extends StatelessWidget {
  ControlButton({this.color, this.onPressed});

  final Color? color;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextButton(
        child: Container(
          color: color,
        ),
        onPressed: onPressed,
      ),
    );
  }
}
