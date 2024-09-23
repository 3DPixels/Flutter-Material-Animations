import 'package:flutter/material.dart';
import 'package:animations/animations.dart';

class FadeScaleDemo extends StatelessWidget {
  const FadeScaleDemo({super.key});

  //Explanation of the Fade Scale animation:
  //
  // We use the OpenContainer widget, which handles the animation between a "closed" state and an "open" state.
  // The closedBuilder returns the widget to show in the closed state. In this example, it's a FloatingActionButton.
  // The openBuilder returns the widget to show in the open state. Here, it's a new Scaffold with an app bar and a close button.
  // When the button is pressed, it animates to the new page using a fade and scale animation.
  // This is particularly useful for expanding a small widget into a full page or dialog.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Fade Scale Demo')),
      body: Center(
        child: OpenContainer(
          transitionType: ContainerTransitionType.fadeThrough,
          closedColor: Colors.transparent,
          closedElevation: 0,
          closedBuilder: (context, openContainer) {
            return ElevatedButton(
              onPressed: openContainer,
              child: const Text('Open Details'),
            );
          },
          openBuilder: (context, closeContainer) {
            return DetailPage(closeContainer: closeContainer);
          },
        ),
      ),
    );
  }
}

class DetailPage extends StatelessWidget {
  final VoidCallback closeContainer;

  const DetailPage({super.key, required this.closeContainer});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Details')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('This is the detail page', style: TextStyle(fontSize: 24)),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: closeContainer,
              child: const Text('Close'),
            ),
          ],
        ),
      ),
    );
  }
}
