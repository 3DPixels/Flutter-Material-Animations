import 'package:flutter/material.dart';
import 'package:animations/animations.dart';

class FadeThroughExample extends StatefulWidget {
  const FadeThroughExample({super.key});

  @override
  _FadeThroughExampleState createState() => _FadeThroughExampleState();
}

class _FadeThroughExampleState extends State<FadeThroughExample> {
  final bool _showFirstPage = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("FadeThrough Animation")),
      body: Center(
        child: OpenContainer(
          transitionType: ContainerTransitionType.fadeThrough,
          closedBuilder: (context, action) {
            return ElevatedButton(
              onPressed: action,
              child: const Text("Show Next Page"),
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
        child: Text("FadeThrough Transition!"),
      ),
    );
  }
}
