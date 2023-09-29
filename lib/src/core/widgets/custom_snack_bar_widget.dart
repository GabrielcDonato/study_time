import 'package:flutter/material.dart';

sealed class CustomSnackBarWidget {
  static void show({
    required BuildContext context,
    Color? backgroundColor,
    required String title,
  }) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(milliseconds: 800),
        backgroundColor: backgroundColor,
        dismissDirection: DismissDirection.horizontal,
        content: Text(title),
      ),
    );
  }
}
