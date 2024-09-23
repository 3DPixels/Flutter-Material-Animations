import 'package:flutter/material.dart';
import 'package:animations/animations.dart';

class FadeSnackBarExample extends StatefulWidget {
  const FadeSnackBarExample({super.key});

  @override
  _FadeSnackBarExampleState createState() => _FadeSnackBarExampleState();
}

class _FadeSnackBarExampleState extends State<FadeSnackBarExample>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _showFadeSnackBar(BuildContext context) {
    _controller.forward(from: 0); // Restart the animation

    final snackBar = SnackBar(
      backgroundColor: Colors.transparent, // Transparent background
      elevation: 0,
      behavior: SnackBarBehavior.floating, // Floating snackbar style
      content: FadeScaleTransition(
        animation: _controller,
        child: Container(
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: const Text(
            'This is a snackbar with fade animation!',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Fade Snackbar Animation")),
      body: Center(
        child: ElevatedButton(
          onPressed: () => _showFadeSnackBar(context),
          child: const Text("Show Fade Snackbar"),
        ),
      ),
    );
  }
}
