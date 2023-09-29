import 'package:flutter/material.dart';

enum ButtonState { primary, secondary, disabled }

extension GetColor on ButtonState {
  Color getColor() {
    if (this == ButtonState.primary) {
      return Colors.red;
    }
    if (this == ButtonState.secondary) {
      return Colors.white;
    }
    return Colors.red.shade200;
  }
}
