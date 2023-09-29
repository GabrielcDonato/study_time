import 'package:flutter/widgets.dart';

class HideKeyboardWidget extends StatelessWidget {
  const HideKeyboardWidget({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: child,
    );
  }
}
