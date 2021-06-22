import 'package:flutter/material.dart';
import 'package:rover_controller_app/components/control_set.dart';

const PAGE_TITLE = 'Rover Command';

class ControlPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(PAGE_TITLE),
      ),
      body: Column(
        children: [
          ControlSet(),
          Expanded(
              child: Row(
            children: [],
          ))
        ],
      ),
    );
  }
}
