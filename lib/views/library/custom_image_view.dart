
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizzo/widgets/animate_shimmerEffect.dart';

customImage({
  required String imageUrl,
  double? width,
  double? height,
  BoxFit? fit,
  bool isProfile = false,
  double? errorHeight,
  double? borderRadius,
  double? radius,
}) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(radius ?? 50),
    child: CachedNetworkImage(
      imageUrl: imageUrl,
      width: width ?? double.infinity,
      height: height,
      fit: fit ?? BoxFit.cover,
      placeholder: (context, url) => ShimmerEffect(),
      errorWidget: (context, error, stackTrace) {
        return isProfile == true
            ? Image.asset(
                'assets/images/portal/defult-profile.png',
                width: width,
                height: height,
                fit: BoxFit.cover,
              )
            : Container(
                height: height ?? errorHeight,
                color: Get.isDarkMode ? Colors.black38 : Colors.grey[100]!,
                child: Icon(Icons.broken_image, color: Colors.grey),
              );
      },
    ),
  );
}
