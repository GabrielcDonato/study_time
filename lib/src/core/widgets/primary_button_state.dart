import 'package:flutter/material.dart';
import 'package:study_time/src/core/colors/app_colors.dart';

enum ButtonState { primary, secondary, disabled }

extension GetColor on ButtonState {
  Color getColor() {
    if (this == ButtonState.primary) {
      return AppColors.primaryColor;
    }
    if (this == ButtonState.secondary) {
      return AppColors.secondaryColor;
    }
    return Colors.red.shade200;
  }
}
