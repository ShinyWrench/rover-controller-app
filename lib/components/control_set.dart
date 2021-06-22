import 'package:flutter/material.dart';
import 'package:rover_controller_app/services/command_sender.dart';

class ControlSet extends StatelessWidget {
  final CommandSender _commandSender = CommandSender();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                ControlButton(color: null),
                ControlButton(
                  color: Colors.orange,
                  onPressed: () => _commandSender.move(1),
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
                  onPressed: () => _commandSender.turn(-1),
                ),
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
