import 'package:animations/animations.dart';
import 'package:flutter/material.dart';

import '../page1.dart';
import '../page2.dart';

class SharedAxisTransitionDemo extends StatefulWidget {
  const SharedAxisTransitionDemo({super.key});

  @override
  State<SharedAxisTransitionDemo> createState() =>
      _SharedAxisTransitionDemoState();
}

int index = 0;

//Explanation of the Shared Axis animation:
//
// The structure is similar to the Fade Through animation, but we use SharedAxisTransition instead.
// The transitionType parameter specifies the direction of the animation. It can be horizontal, vertical, or scaled.
// This animation is great for transitioning between pages that are conceptually close to each other in an information hierarchy.

class _SharedAxisTransitionDemoState extends State<SharedAxisTransitionDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shared Axis Transition Demo'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            index = index == 0 ? 1 : 0;
          });
        },
        child: const Icon(Icons.next_plan_rounded),
      ),
      body: PageTransitionSwitcher(
        transitionBuilder: (
          Widget child,
          Animation<double> animation,
          Animation<double> secondaryAnimation,
        ) {
          return SharedAxisTransition(
            animation: animation,
            secondaryAnimation: secondaryAnimation,
            transitionType: SharedAxisTransitionType.horizontal,
            child: child,
          );
        },
        child: index == 0 ? const Page1() : const Page2(),
      ),
    );
  }
}
