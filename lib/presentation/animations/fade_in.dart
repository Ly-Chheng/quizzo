import 'package:flutter/material.dart';

class FadeIn extends StatefulWidget {
  final Widget child;
  final Duration duration;

  const FadeIn({super.key, required this.child, this.duration = const Duration(milliseconds: 500)});

  @override
  State<FadeIn> createState() => _FadeInState();
}

class _FadeInState extends State<FadeIn> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.duration);
    _animation = Tween<double>(begin: 0, end: 1).animate(_controller);
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(opacity: _animation, child: widget.child);
  }
}


// Usage inside a screen:
// FadeIn(
//   child: Text("Welcome to Quizzo!", style: Theme.of(context).textTheme.headlineMedium),
// )