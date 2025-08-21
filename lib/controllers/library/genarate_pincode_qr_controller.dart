// ignore_for_file: deprecated_member_use
import 'dart:io';
import 'dart:math';
import 'dart:typed_data';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:gallery_saver_plus/gallery_saver.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:quizzo/core/utils/app_color.dart';
import 'package:quizzo/core/utils/app_fonts.dart';
import 'package:share_plus/share_plus.dart';

class PinCodeQRController extends GetxController {
  var pinCode = ''.obs;

  void generatePinCode() {
    Random random = Random();
    pinCode.value = '${(100000 + (100000 * 3 * random.nextDouble())).toInt()}';
  }

  GlobalKey qrKey = GlobalKey();

  Future<void> shareQrCodeImage(BuildContext context) async {
    try {
      // Render the widget and capture the image
      RenderRepaintBoundary boundary =
          qrKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
      var image = await boundary.toImage(pixelRatio: 3.0);
      ByteData? byteData = await image.toByteData(format: ImageByteFormat.png);
      if (byteData != null) {
        Uint8List pngBytes = byteData.buffer.asUint8List();
        final directory = await getTemporaryDirectory();
        final imagePath = File('${directory.path}/qr_code.png');
        await imagePath.writeAsBytes(pngBytes);

        RenderBox renderBox =
            qrKey.currentContext!.findRenderObject() as RenderBox;
        Offset offset = renderBox.localToGlobal(Offset.zero);
        await Share.shareXFiles(
          [XFile(imagePath.path)],
          text: 'Share your profile QR code',
          sharePositionOrigin: Rect.fromLTWH(offset.dx, offset.dy,
              renderBox.size.width, renderBox.size.height),
        );
      }
    } catch (e) {
      debugPrint("Error sharing QR code: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Error sharing QR code: $e"),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }

  Future<void> downloadQrCodeImage(BuildContext context) async {
    try {
      RenderRepaintBoundary boundary =
          qrKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
      var image = await boundary.toImage(pixelRatio: 3.0);
      ByteData? byteData = await image.toByteData(format: ImageByteFormat.png);
      if (byteData != null) {
        Uint8List pngBytes = byteData.buffer.asUint8List();
        final directory = await getTemporaryDirectory();
        final imagePath = File('${directory.path}/qr_code.png');
        await imagePath.writeAsBytes(pngBytes);

        bool? success = await GallerySaver.saveImage(imagePath.path);
        if (success != null && success) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.green,
              content: Row(
                children: [
                  Icon(
                    Icons.check,
                    color: Colors.white,
                  ),
                  const SizedBox(width: 8),
                  Text("save_to_gallery".tr,
                      style: Style.bodyText14_16(context)),
                ],
              ),
              duration: Duration(seconds: 2),
              behavior: SnackBarBehavior.fixed,
            ),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: AppColor().errorColor,
              content: Text(
                "Failed to save QR code to gallery.",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: Get.context!.isPhone ? 14 : 16),
              ),
              duration: Duration(seconds: 2),
            ),
          );
        }
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: AppColor().errorColor,
          content: Text("An error occurred while saving the QR code."),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }
}
