import 'package:flutter/material.dart';

class SlideIn extends StatelessWidget {
  final Widget child;
  final Offset beginOffset;

  const SlideIn({super.key, required this.child, this.beginOffset = const Offset(1, 0)});

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: Tween<Offset>(begin: beginOffset, end: Offset.zero),
      duration: const Duration(milliseconds: 500),
      child: child,
      builder: (context, Offset offset, child) {
        return Transform.translate(offset: offset * 200, child: child);
      },
    );
  }
}

// Usage
// SlideIn(
//   child: ElevatedButton(onPressed: () {}, child: const Text("Start Quiz")),
// )
