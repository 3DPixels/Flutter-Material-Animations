import 'package:flutter/material.dart';
import 'package:animations/animations.dart';

class FadeScaleExample extends StatelessWidget {
  const FadeScaleExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("FadeScale Animation")),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            showModal(
              context: context,
              builder: (context) {
                return FadeScaleTransition(
                  animation: const AlwaysStoppedAnimation(1.0),
                  // Controls animation progress
                  child: AlertDialog(
                    title: const Text('FadeScale Dialog'),
                    content: const Text('This dialog fades in and scales up!'),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: const Text('Close'),
                      ),
                    ],
                  ),
                );
              },
            );
          },
          child: const Text("Show Dialog"),
        ),
      ),
    );
  }
}
