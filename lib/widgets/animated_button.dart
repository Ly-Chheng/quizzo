library animated_button;

import 'package:flutter/material.dart';

class AnimatedButton extends StatefulWidget {
  final Color color;
  final Widget child;
  final bool enabled;
  final double width;
  final int duration;
  final double height;
  final Color disabledColor;
  final double borderRadius;
  final VoidCallback onPressed;
  final ShadowDegree shadowDegree;
  final Color shadowColor;

  const AnimatedButton({
    super.key,
    required this.child,
    required this.onPressed,
    this.height = 40,
    this.width = double.infinity,
    this.duration = 70,
    this.enabled = true,
    this.borderRadius = 20,
    this.color = Colors.blue,
    this.disabledColor = Colors.white70,
    this.shadowDegree = ShadowDegree.light,
    //this.shadowColor = const Color(0xFFEEEEEE)
    this.shadowColor = const Color.fromARGB(255, 217, 217, 217)

  });

  @override
  // ignore: library_private_types_in_public_api
  _AnimatedButtonState createState() => _AnimatedButtonState();
}

class _AnimatedButtonState extends State<AnimatedButton> {
  static const Curve _curve = Curves.easeIn;
  static const double _shadowHeight = 4;
  double _position = 4;

  @override
  Widget build(BuildContext context) {
    final double _height = widget.height - _shadowHeight;

    return GestureDetector(
      onTapDown: widget.enabled ? _pressed : null,
      onTapUp: widget.enabled ? _unPressedOnTapUp : null,
      onTapCancel: widget.enabled ? _unPressed : null,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final double actualWidth = widget.width == double.infinity
              ? constraints.maxWidth
              : widget.width;

          return SizedBox(
            width: actualWidth,
            height: _height + _shadowHeight,
            child: Stack(
              children: <Widget>[
                Positioned(
                  bottom: 0,
                  child: Container(
                    height: _height,
                    width: actualWidth,
                    decoration: BoxDecoration(
                      color: widget.shadowColor,
                      borderRadius: _getBorderRadius(),
                    ),
                  ),
                ),
                AnimatedPositioned(
                  curve: _curve,
                  duration: Duration(milliseconds: widget.duration),
                  bottom: _position,
                  child: Container(
                    height: _height,
                    width: actualWidth,
                    decoration: BoxDecoration(
                      color:
                          widget.enabled ? widget.color : widget.disabledColor,
                      borderRadius: _getBorderRadius(),
                    ),
                    child: Center(child: widget.child),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  void _pressed(_) {
    setState(() {
      _position = 0;
    });
  }

  void _unPressedOnTapUp(_) => _unPressed();

  void _unPressed() {
    setState(() {
      _position = 4;
    });
    widget.onPressed();
  }

  BorderRadius? _getBorderRadius() {
    return BorderRadius.circular(widget.borderRadius);
  }
}

Color darken(Color color, ShadowDegree degree) {
  double amount = degree == ShadowDegree.dark ? 0.3 : 0.12;
  final hsl = HSLColor.fromColor(color);
  final hslDark = hsl.withLightness((hsl.lightness - amount).clamp(0.0, 1.0));

  return hslDark.toColor();
}

enum ShadowDegree { light, dark }
