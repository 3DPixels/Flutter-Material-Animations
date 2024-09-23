import 'package:flutter/material.dart';
import 'package:flutter_material_animations/fade_scale_exampleGPT.dart';
import 'package:flutter_material_animations/slide_exampeGPT.dart';
import 'package:flutter_material_animations/transitions/fade_through_exampleGPT.dart';
import 'package:flutter_material_animations/transitions/shared_axis_exampleGPT.dart';
import 'package:flutter_material_animations/transitions/shared_axis_transition_demo.dart';

import 'container_exampleGPT.dart';
import 'fab_exampleGPT.dart';
import 'fade_scale_demo.dart';
import 'fade_snacbar_demo.dart';
import 'fade_snackbar_exampleGPT.dart';
import 'slide_snackbar_exampleGPT.dart';
import 'transitions/fade_through_transition_demo.dart';

class Menu extends StatelessWidget {
  const Menu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const FadeThroughTransitionDemo(),
                  ),
                );
              },
              child: const Text('Fade Through Transition')),
          TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FadeThroughExample(),
                  ),
                );
              },
              child: const Text('Fade Through TransitionGPT')),
          TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SharedAxisTransitionDemo(),
                  ),
                );
              },
              child: const Text('Shared Axis Transition')),
          TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SharedAxisExample(),
                  ),
                );
              },
              child: const Text('Shared Axis Transition GPT')),
          TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const FadeScaleDemo(),
                  ),
                );
              },
              child: const Text('Fade Scale Animation')),
          TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const FadeScaleExample(),
                  ),
                );
              },
              child: const Text('Fade Scale Animation GPT')),
          TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SlideTransitionExample(),
                  ),
                );
              },
              child: const Text('Slide Example GPT')),
          TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ContainerTransformExample(),
                  ),
                );
              },
              child: const Text('Container Animation GPT')),
          TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FabOpenContainerExample(),
                  ),
                );
              },
              child: const Text('FAB GPT')),
          TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const FadeSnackbarDemo(),
                  ),
                );
              },
              child: const Text('Fade Snackbar Animation')),
          TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const FadeSnackBarExample(),
                  ),
                );
              },
              child: const Text('Fade Snackbar Animation GPT')),
          TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SlideSnackBarExample(),
                  ),
                );
              },
              child: const Text('Slide Snackbar Animation GPT')),
        ],
      ),
    );
  }
}
