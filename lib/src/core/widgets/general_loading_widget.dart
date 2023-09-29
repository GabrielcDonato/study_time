import 'package:flutter/material.dart';
import 'package:study_time/src/core/colors/app_colors.dart';

class GeneralLoadingWidget extends StatelessWidget {
  const GeneralLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        color: AppColors.primaryColor,
      ),
    );
  }
}
