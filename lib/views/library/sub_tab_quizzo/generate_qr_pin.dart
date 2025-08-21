import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:quizzo/controllers/library/genarate_pincode_qr_controller.dart';
import 'package:quizzo/core/utils/app_color.dart';
import 'package:quizzo/core/utils/app_fonts.dart';
import 'package:quizzo/widgets/animated_button.dart';
import 'package:quizzo/widgets/custom_appbar.dart';

class GenerateQRPinCode extends StatelessWidget {
  final String pinCode;

  const GenerateQRPinCode({super.key, required this.pinCode});
  void copyToClipboard(BuildContext context) {
    log('Copied to clipboard: $pinCode');
    Clipboard.setData(ClipboardData(text: pinCode)).then((_) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text(
          'PIN Code copied to clipboard',
          style: Style.bodyText14_16(context),
        )),
      );
    }).catchError((error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to copy PIN Code: $error')),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(PinCodeQRController());
    return Scaffold(
      appBar: CustomAppBar(
        title: "Generate PIN & QR Code",
        context: context,
        isLeading: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 15, right: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 30),
              RepaintBoundary(
                key: controller.qrKey,
                child: Padding(
                  padding: Get.context!.isPhone
                      ? const EdgeInsets.all(20.0)
                      : EdgeInsets.all(30.0),
                  child: QrImageView(
                    data: pinCode,
                    version: QrVersions.auto,
                    size: Get.context!.isPhone
                        ? Get.width * 0.8
                        : Get.width * 0.3,
                    // ignore: deprecated_member_use
                    foregroundColor:
                        Get.context!.isDarkMode ? Colors.white : Colors.black,
                    backgroundColor: Get.context!.isDarkMode
                        ? Theme.of(context).cardColor
                        : const Color.fromARGB(255, 247, 247, 247),
                    gapless: false,
                    padding: EdgeInsets.all(20),
                  ),
                ),
              ),
              SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  copyToClipboard(context);
                },
                child: Text(
                  pinCode,
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Tap code to copy',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              SizedBox(height: 10),
              Divider(
                color: AppTheme().borderTheme,
                thickness: 1,
              ),
              Text(
                'PIN & QR Code are unique and different for each player, you can invite your friends to play quizzes on one server with the code above.',
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: Style.subHeaderTextStyleGray22_24(context),
              ),
              SizedBox(height: 30),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            color: AppTheme().borderTheme,
            width: double.infinity,
            height: 1,
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 20),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: AnimatedButton(
                        height: (Get.context?.isPhone ?? true) ? 50 : 60,
                        color: AppColor().secondaryprimaryColor,
                        borderRadius: 25,
                        shadowColor: Color.fromARGB(255, 211, 174, 129),
                        duration: 100,
                        enabled: true,
                        onPressed: () {
                          controller.downloadQrCodeImage(context);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.save_alt,
                              color: AppColor().primaryColor,
                            ),
                            SizedBox(width: 5),
                            Text(
                              'Save'.tr,
                              style: Style.button(context)
                                  .copyWith(color: AppColor().primaryColor),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: AnimatedButton(
                        height: (Get.context?.isPhone ?? true) ? 50 : 60,
                        color: AppColor().primaryColor,
                        borderRadius: 25,
                        shadowColor: Color.fromARGB(255, 232, 139, 32),
                        duration: 100,
                        enabled: true,
                        onPressed: () {
                          controller.shareQrCodeImage(context);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.screen_share_outlined,
                              color: Colors.white,
                            ),
                            SizedBox(width: 5),
                            Text(
                              'Share'.tr,
                              style: Style.button(context),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
