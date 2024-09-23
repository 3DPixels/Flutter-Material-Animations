import 'package:flutter/material.dart';
import 'package:animations/animations.dart';

class SharedAxisExample extends StatefulWidget {
  const SharedAxisExample({super.key});

  @override
  _SharedAxisExampleState createState() => _SharedAxisExampleState();
}

class _SharedAxisExampleState extends State<SharedAxisExample> {
  bool _showFirstPage = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Shared Axis Animation")),
      body: PageTransitionSwitcher(
        duration: const Duration(milliseconds: 500),
        reverse: !_showFirstPage,
        transitionBuilder: (child, animation, secondaryAnimation) {
          return SharedAxisTransition(
            animation: animation,
            secondaryAnimation: secondaryAnimation,
            transitionType: SharedAxisTransitionType.horizontal,
            child: child,
          );
        },
        child: _showFirstPage ? const FirstPage() : const SecondPage(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _showFirstPage = !_showFirstPage;
          });
        },
        child: const Icon(Icons.swap_horiz),
      ),
    );
  }
}

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("First Page"));
  }
}

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("Second Page"));
  }
}
