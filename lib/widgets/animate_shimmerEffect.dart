import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerEffect extends StatelessWidget {
  double? height;
  double? width;
  ShimmerEffect({super.key, this.height, this.width});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? 200.0,
      height: height ?? 100.0,
      child: Shimmer.fromColors(
        baseColor: Colors.grey[400]!,
        highlightColor: Colors.grey[300]!,
        child: Container(
            width: 200.0,
            height: 100.0,
            decoration: BoxDecoration(
                color: Colors.grey[400]!,
                borderRadius: BorderRadius.circular(16.0))),
      ),
      // child: const Text(
      //   'Shimmer',
      //   textAlign: TextAlign.center,
      //   style: TextStyle(
      //     fontSize: 40.0,
      //     fontWeight: FontWeight.bold,
      //   ),
      // ),
    );
  }
}
