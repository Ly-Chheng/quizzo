import 'package:flutter/material.dart';

class HexagonDots extends StatelessWidget {
  const HexagonDots({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(5, (index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4.0),
          child: Transform.rotate(
            angle: 0.52, // rotate square to resemble hexagon-ish
            child: Container(
              width: 16,
              height: 16,
              decoration: BoxDecoration(
                color: Colors.orange,
                shape: BoxShape.rectangle,
              ),
            ),
          ),
        );
      }),
    );
  }
}
