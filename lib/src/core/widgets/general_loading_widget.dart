import 'package:flutter/material.dart';

class GeneralLoadingWidget extends StatelessWidget {
  const GeneralLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        color: Colors.red,
      ),
    );
  }
}
