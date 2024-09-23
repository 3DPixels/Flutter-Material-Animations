import 'package:flutter/material.dart';
import 'package:animations/animations.dart';

class FabOpenContainerExample extends StatelessWidget {
  const FabOpenContainerExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("FAB OpenContainer Animation")),
      body: const Center(
        child: Text("Tap on the FAB to open another page"),
      ),
      floatingActionButton: OpenContainer(
        transitionType: ContainerTransitionType.fadeThrough,
        closedShape: const CircleBorder(),
        closedColor: Theme.of(context).primaryColor,
        closedElevation: 6.0,
        transitionDuration: const Duration(milliseconds: 600),
        openBuilder: (BuildContext context, VoidCallback _) {
          return const SecondPage();
        },
        closedBuilder: (BuildContext context, VoidCallback openContainer) {
          return FloatingActionButton(
            onPressed: openContainer,
            child: const Icon(Icons.add),
          );
        },
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
        child: Text("This is the second page!"),
      ),
    );
  }
}
