import 'dart:math';
import 'package:flutter/material.dart';


class RotatingDotsLoader extends StatefulWidget {
  const RotatingDotsLoader({super.key});

  @override
  State<RotatingDotsLoader> createState() => _RotatingDotsLoaderState();
}

class _RotatingDotsLoaderState extends State<RotatingDotsLoader>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (_, child) {
        return Transform.rotate(
          angle: _controller.value * 2 * pi,
          child: child,
        );
      },
      child: SizedBox(
        width: 80,
        height: 80,
        child: Stack(
          alignment: Alignment.center,
          children: List.generate(8, (index) {
            final angle = (index * pi / 4);
            final radius = 30.0;
            final sizes = [12.0, 10.0, 8.0, 6.0, 5.0, 6.0, 8.0, 10.0];
            return Transform.translate(
              offset: Offset(
                radius * cos(angle),
                radius * sin(angle),
              ),
              child: Container(
                width: sizes[index],
                height: sizes[index],
                decoration: const BoxDecoration(
                  color: Color(0xFFFFA63D), // Purple color
                  shape: BoxShape.circle,
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
