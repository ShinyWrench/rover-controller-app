class CommandSender {
  // TODO: Probably use a constructor arg or two for BluetoothSerial object(s)
  CommandSender() {
    // TODO: Start timed task for writing _command to bluetooth
  }

  int _command = 0;

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
