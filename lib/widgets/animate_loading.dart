// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

class AnimateLoading extends StatelessWidget {
  String? title;
  AnimateLoading({super.key, this.title});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SpinKitPouringHourGlassRefined(
            color: Colors.red,
            size: 50.0,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            title ?? "Loading".tr,
          )
        ],
      ),
    );
  }

  void showLoading(
    BuildContext context, {
    String? content,
    int? layerContext,
    String? data,
    bool dismiss = false,
  }) async {
    showGeneralDialog(
      context: context,
      barrierDismissible: dismiss,
      pageBuilder: (context, animation, secondaryAnimation) => Scaffold(
        backgroundColor: const Color.fromRGBO(255, 255, 255, 0.3),
        body: Center(
          child: Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            alignment: Alignment.center,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                SpinKitThreeBounce(
                  color: Colors.amber,
                  size: 20.0,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  content == null ? "Loading".tr : content.tr,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
