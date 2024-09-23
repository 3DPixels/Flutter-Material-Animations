import 'package:flutter/material.dart';
import 'package:animations/animations.dart';

class ContainerTransformExample extends StatelessWidget {
  const ContainerTransformExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Container Transform Animation")),
      body: Center(
        child: OpenContainer(
          transitionType: ContainerTransitionType.fadeThrough,
          closedShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          closedColor: Colors.blue,
          closedElevation: 0,
          openElevation: 4,
          transitionDuration: const Duration(seconds: 1),
          closedBuilder: (context, openContainer) {
            return Container(
              height: 100,
              width: 100,
              color: Colors.blue,
              child: const Center(
                  child: Text("Open", style: TextStyle(color: Colors.white))),
            );
          },
          openBuilder: (context, _) {
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
        child: Text("Container Transformed!"),
      ),
    );
  }
}
