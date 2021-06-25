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
                  onTouch: (event) => _commandSender.send(RoverCommand.forward),
                  onRelease: (event) => _commandSender.send(RoverCommand.stop),
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
                  onTouch: (event) => _commandSender.send(RoverCommand.left),
                  onRelease: (event) => _commandSender.send(RoverCommand.stop),
                ),
                ControlButton(),
                ControlButton(
                  color: Colors.orange,
                  onTouch: (event) => _commandSender.send(RoverCommand.right),
                  onRelease: (event) => _commandSender.send(RoverCommand.stop),
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
                  onTouch: (event) => _commandSender.send(RoverCommand.reverse),
                  onRelease: (event) => _commandSender.send(RoverCommand.stop),
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
  ControlButton({this.color, this.onTouch, this.onRelease});

  final Color? color;
  final Function(PointerDownEvent)? onTouch;
  final Function(PointerUpEvent)? onRelease;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Listener(
        child: Container(
          color: color,
        ),
        onPointerDown: onTouch,
        onPointerUp: onRelease,
      ),
    );
  }
}
