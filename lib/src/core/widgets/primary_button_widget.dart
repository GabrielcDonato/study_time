import 'package:flutter/material.dart';
import 'package:study_time/src/core/widgets/primary_button_state.dart';

class GeneralButtonWidget extends StatelessWidget {
  final bool isLoading;
  final VoidCallback? onPressed;
  final ButtonState state;
  final String title;
  const GeneralButtonWidget({
    Key? key,
    this.isLoading = false,
    required this.onPressed,
    this.state = ButtonState.primary,
    required this.title,
  }) : super(key: key);

  bool get ignoringPointer => isLoading || state == ButtonState.disabled;

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: ignoringPointer,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          foregroundColor:
              state == ButtonState.primary ? Colors.white : Colors.red,
          backgroundColor: state.getColor(),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(999),
            side: BorderSide(
              color: state == ButtonState.primary
                  ? Colors.transparent
                  : Colors.red,
              width: 2,
            ),
          ),
        ),
        child: isLoading
            ? const Padding(
                padding: EdgeInsets.symmetric(vertical: 4),
                child: SizedBox(
                  height: 14,
                  width: 14,
                  child: CircularProgressIndicator.adaptive(
                    backgroundColor: Colors.white,
                  ),
                ),
              )
            : Text(
                title,
              ),
      ),
    );
  }
}
