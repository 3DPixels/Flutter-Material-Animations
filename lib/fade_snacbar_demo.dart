import 'package:flutter/material.dart';
import 'package:animations/animations.dart';

class FadeSnackbarDemo extends StatelessWidget {
  const FadeSnackbarDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Fade Snackbar Example')),
      body: Center(
        child: ElevatedButton(
          child: const Text('Show Snackbar'),
          onPressed: () => _showSnackbar(context),
        ),
      ),
    );
  }

  void _showSnackbar(BuildContext context) {
    late final OverlayEntry overlayEntry;

    overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        bottom: 32.0,
        left: 16.0,
        right: 16.0,
        child: SafeArea(
          child: _FadingSnackbar(
            message: 'This is a fading snackbar!',
            onDismiss: () {
              overlayEntry.remove();
            },
            duration: const Duration(seconds: 4),
          ),
        ),
      ),
    );

    Overlay.of(context).insert(overlayEntry);
  }
}

class _FadingSnackbar extends StatefulWidget {
  final String message;
  final VoidCallback onDismiss;
  final Duration duration;

  const _FadingSnackbar({
    required this.message,
    required this.onDismiss,
    required this.duration,
  });

  @override
  _FadingSnackbarState createState() => _FadingSnackbarState();
}

class _FadingSnackbarState extends State<_FadingSnackbar>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 150),
      reverseDuration: const Duration(milliseconds: 75),
    );
    _animationController.forward();
    _scheduleDismissal();
  }

  void _scheduleDismissal() {
    Future.delayed(widget.duration, () {
      if (mounted) {
        _animationController.reverse().then((_) {
          widget.onDismiss();
        });
      }
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeScaleTransition(
      animation: _animationController,
      child: _CustomSnackbar(
        message: widget.message,
        onDismiss: () {
          _animationController.reverse().then((_) {
            widget.onDismiss();
          });
        },
      ),
    );
  }
}

class _CustomSnackbar extends StatelessWidget {
  final String message;
  final VoidCallback onDismiss;

  const _CustomSnackbar({
    required this.message,
    required this.onDismiss,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 4.0,
      borderRadius: BorderRadius.circular(8.0),
      color: Colors.blue,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
        child: Row(
          children: [
            Expanded(
              child: Text(
                message,
                style: const TextStyle(color: Colors.white),
              ),
            ),
            IconButton(
              icon: const Icon(Icons.close, color: Colors.white),
              onPressed: onDismiss,
            ),
          ],
        ),
      ),
    );
  }
}
