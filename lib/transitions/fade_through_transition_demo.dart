import 'package:animations/animations.dart';
import 'package:flutter/material.dart';

import '../page1.dart';
import '../page2.dart';

class FadeThroughTransitionDemo extends StatefulWidget {
  const FadeThroughTransitionDemo({super.key});

  @override
  State<FadeThroughTransitionDemo> createState() =>
      _FadeThroughTransitionDemoState();
}

int index = 0;

//Explanation of the Fade Through animation:
//
// We use the PageTransitionSwitcher widget, which handles the animation between different pages or screens.
// The transitionBuilder property is where we define our animation. We use the FadeThroughTransition widget provided by the 'animations' package.
// The animation and secondaryAnimation parameters are used to control the timing and progress of the animation.
// The child parameter is the widget that will be animated. In this example, it's provided by the _getPage() method.
// You would typically use this in a stateful widget where you can change the child based on user interaction or other events.

class _FadeThroughTransitionDemoState extends State<FadeThroughTransitionDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fade Through Transition Demo'),
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
          return FadeThroughTransition(
            animation: animation,
            secondaryAnimation: secondaryAnimation,
            child: child,
          );
        },
        child: index == 0 ? const Page1() : const Page2(),
      ),
    );
  }
}
