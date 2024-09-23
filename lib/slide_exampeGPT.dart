import 'package:flutter/material.dart';
import 'package:animations/animations.dart';

class SlideTransitionExample extends StatelessWidget {
  const SlideTransitionExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("SlideTransition Animation")),
      body: Center(
        child: OpenContainer(
          transitionType: ContainerTransitionType.fade,
          closedBuilder: (context, action) {
            return ElevatedButton(
              onPressed: action,
              child: const Text("Slide to Next Page"),
            );
          },
          openBuilder: (context, action) {
            return const SecondPage();
          },
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Second Page")),
      body: const Center(
        child: Text("Sliding Transition!"),
      ),
    );
  }
}
