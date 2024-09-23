import 'package:flutter/material.dart';

class SlideSnackBarExample extends StatefulWidget {
  const SlideSnackBarExample({super.key});

  @override
  _SlideSnackBarExampleState createState() => _SlideSnackBarExampleState();
}

class _SlideSnackBarExampleState extends State<SlideSnackBarExample>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _fadeAnimation =
        CurvedAnimation(parent: _controller, curve: Curves.easeInOut);
  }

  void _showCustomSnackbar() {
    _controller.forward(); // Start fade animation

    final snackBar = SnackBar(
      backgroundColor: Colors.transparent,
      // Making Snackbar background transparent
      elevation: 0,
      content: FadeTransition(
        opacity: _fadeAnimation,
        child: Container(
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: const Text(
            'This is a custom snackbar!',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );

    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Fade Snackbar Animation")),
      body: Center(
        child: ElevatedButton(
          onPressed: _showCustomSnackbar,
          child: const Text("Show Snackbar with Fade"),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
