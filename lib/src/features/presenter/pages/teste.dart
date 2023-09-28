import 'package:flutter/material.dart';
import 'package:study_time/src/core/routes/study_time_named_routes.dart';

class Teste extends StatelessWidget {
  const Teste({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      body: Column(
        children: [
          ElevatedButton(
              onPressed: () => Navigator.pushNamed(
                  context, StudyTimeNamedRoutes.initialPage),
              child: Text('registerar'))
        ],
      ),
    );
  }
}
