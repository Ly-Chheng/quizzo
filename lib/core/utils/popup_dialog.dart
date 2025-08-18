import 'dart:async';
import 'dart:developer';
import 'dart:io' as IO;
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:quizzo/core/utils/app_color.dart';
import 'package:quizzo/core/utils/app_fonts.dart';
import 'package:quizzo/widgets/animate_loading.dart';

class PopupDialog {
  static Future<bool?> showAlertDialog(
      {required String msg, String title = 'Alert'}) async {
    return Get.dialog(
      AlertDialog(
        title: Text(title),
        content: Text(msg),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Get.back();
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  static Future<void> openAppSetting(
    BuildContext context, {
    required String title,
    required String buttonText,
    required Future<void> Function() openSettingsAction,
  }) async {
    log("openAppSetting called");
    await showDialog(
      barrierDismissible: true,
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: AppTheme().cardTheme,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            child: SizedBox(
              height: Get.context!.height * 0.15,
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(title.tr,
                      style: TextStyle(
                        fontSize: Get.context!.isPhone ? 18 : 17,
                        fontFamily: AppFonts().fontEngBold,
                      )),
                  const SizedBox(height: 10),
                  GestureDetector(
                    onTap: () async {
                      try {
                        log("Trying to open settings");
                        Navigator.pop(context);
                        await openSettingsAction();
                      } catch (err) {
                        // ignore: use_build_context_synchronously
                        Navigator.pop(context);
                        log("Error opening settings: $err");
                      }
                    },
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 5,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Text(
                          buttonText.tr,
                          style: TextStyle(
                            color: AppColor().errorColor,
                            fontFamily: AppFonts().fontEngBold,
                            fontSize: Get.context!.isPhone ? 14 : 13,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  static Future<bool> yesNoPrompt(BuildContext context,
      {String content = 'Have you already checked??',
      Function? onOk,
      Function? onCancel}) async {
    if (content == 'Have you already checked??') {
      content = 'Have you already checked??';
    }
    // Extension.clearFocus(context);
    var result = await showDialog(
      context: context,
      builder: (_) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        contentPadding: const EdgeInsets.only(top: 15, bottom: 10),
        titlePadding: const EdgeInsets.all(0),
        content: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                "Information",
              ),
              Text(
                content,
                style: const TextStyle(
                    fontFamily: 'Khmer OS Content', fontSize: 14),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  TextButton(
                    style: ButtonStyle(
                      padding: const WidgetStatePropertyAll(EdgeInsets.all(2)),
                      overlayColor:
                          WidgetStatePropertyAll(Colors.red.withOpacity(.1)),
                    ),
                    onPressed: () {
                      onCancel ?? Navigator.pop(context, false);
                    },
                    child: Text(
                      "Cancel",
                    ),
                  ),
                  TextButton(
                    style: ButtonStyle(
                      padding: const WidgetStatePropertyAll(EdgeInsets.all(0)),
                      overlayColor:
                          WidgetStatePropertyAll(Colors.green.withOpacity(.1)),
                    ),
                    onPressed: () async {
                      if (onOk != null) {
                        onOk();
                      } else {
                        Navigator.pop(context, true);
                      }
                    },
                    child: Text(
                      "OK".tr,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
    result ??= false;
    return result;
  }

  static final ImagePicker _picker = ImagePicker();
  static late Directory _dir;

  // static Future<File?> _getImage(BuildContext context) async {
  //   var image = await _picker.pickImage(source: ImageSource.gallery);
  //   if (image != null) {
  //     log("IMAGE AAA $image");
  //     _dir = await getApplicationDocumentsDirectory();
  //     var path = p.join(_dir.path,
  //         "${p.basenameWithoutExtension(image.path)}1${p.extension(image.path)}");
  //     log("IMAGE TYPE: ${p.extension(image.path)}");
  //     File? img = await compressAndGetFile(
  //         File(image.path), path, p.extension(image.path));
  //     log("FILE : $img");
  //     return img;
  //   }
  //   return null;
  // }

  static Future<List<File>?> getImage(BuildContext context) async {
    List<File>? result;
    final ImagePicker picker = ImagePicker();
    await showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            child: Container(
              height: 200,
              width: 350,
              decoration: BoxDecoration(
                // border: Border.all(color: Style.appBarColor, width: 2),
                borderRadius: BorderRadius.circular(12),
                color: Colors.white,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        height: 100,
                        width: 130,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border:
                                Border.all(color: Colors.amber, width: 1.5)),
                        child: TextButton(
                          style: ButtonStyle(
                              overlayColor: WidgetStatePropertyAll(
                                  Colors.green.withOpacity(.1))),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                Icons.add_a_photo,
                                color: Colors.amber,
                                size: 30,
                              ),
                              Text(
                                'Camera'.tr,
                              )
                            ],
                          ),
                          onPressed: () async {
                            try {
                              AnimateLoading().showLoading(
                                context,
                              );
                              // check camera permission
                              if (!(await Permission.camera.status.isGranted)) {
                                bool confirm = await PopupDialog.yesNoPrompt(
                                    context,
                                    content:
                                        "You haven't allowed this app to use camera on your phone yet. Click \"OK\" to open in the settings!"
                                            .tr);
                                showAlertDialog(
                                    msg:
                                        "You haven't allowed this app to use camera on your phone yet. Click \"OK\" to open in the settings!"
                                            .tr);
                                if (confirm) {
                                  await openAppSettings();
                                } else {
                                  Navigator.pop(context);
                                  Navigator.pop(context);
                                  return;
                                }
                              }

                              // Capture image
                              final File? file = await _captureImage(context);
                              if (file != null) {
                                result = [file];
                              }
                              Navigator.of(context, rootNavigator: true).pop();
                            } catch (err) {
                              log("Error capturing image: $err");
                              Navigator.of(context, rootNavigator: true).pop();
                            } finally {
                              Navigator.pop(context, result);
                            }
                          },
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Container(
                        height: 100,
                        width: 130,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(width: 1.5)),
                        child: TextButton(
                            style: ButtonStyle(
                                overlayColor: WidgetStatePropertyAll(
                                    Colors.grey.withOpacity(.1))),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Icon(
                                  Icons.image,
                                  size: 30,
                                ),
                                Text(
                                  'Gallery'.tr,
                                )
                              ],
                            ),
                            onPressed: () async {
                              try {
                                final List<XFile> images =
                                    await picker.pickMultiImage(
                                  imageQuality: 50,
                                  maxHeight: 1080,
                                  maxWidth: 1080,
                                );

                                if (images.isNotEmpty) {
                                  final Directory dir =
                                      await getApplicationDocumentsDirectory();

                                  //compress and return files
                                  List<File> compressImages = [];
                                  for (var image in images) {
                                    var extension =
                                        p.extension(image.path).toLowerCase();
                                    var path = p.join(
                                      dir.path,
                                      "${p.basenameWithoutExtension(image.path)}1${p.extension(image.path)}",
                                    );
                                    if (extension == '.webp') {
                                      log("Skipping compression for .webp file: ${image.path}");
                                      compressImages.add(File(image.path));
                                      continue;
                                    }

                                    log("Target path for compression: $path");
                                    log("Processing image: ${image.path}");
                                    try {
                                      File? img = await compressAndGetFile(
                                          File(image.path),
                                          path,
                                          p.extension(image.path));
                                      if (img != null) {
                                        compressImages.add(img);
                                        log('Compressed image: ${img.path}');
                                      } else {
                                        log('Failed to compress image: ${image.path}');
                                      }
                                    } catch (e) {
                                      log('Failedssss to compress image: ${image.path}');
                                    }
                                  }
                                  result = compressImages;
                                  log('Result in dialog after operation: $result');
                                }
                              } catch (e) {
                                log("Error selecting images: $e");
                                Navigator.of(context, rootNavigator: true)
                                    .pop();
                              } finally {
                                Navigator.pop(context, result);
                              }
                            }),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        });
    return result;
  }

  static Future<File?> _captureImage(BuildContext context) async {
    var image = await _picker.pickImage(source: ImageSource.camera);
    _dir = await getApplicationDocumentsDirectory();
    var path = p.join(_dir.path,
        "${p.basenameWithoutExtension(image!.path)}1${p.extension(image.path)}");
    log("Path: $path");
    File? img = await compressAndGetFile(
        File(image.path), path, p.extension(image.path));
    return img;
  }

  static Future<File?> compressAndGetFile(
      File file, String targetPath, String fileType,
      {int quality = 50}) async {
    try {
      CompressFormat format;
      switch (fileType.toLowerCase()) {
        case ".jpg":
          format = CompressFormat.jpeg;
          break;
        case ".jpeg":
          format = CompressFormat.jpeg;
          break;
        case ".png":
          format = CompressFormat.png;
          break;
        default:
          throw "Unsupported file type: $fileType";
      }
      var result = await FlutterImageCompress.compressAndGetFile(
          file.absolute.path, targetPath,
          quality: quality, autoCorrectionAngle: true, format: format);
      return File(result!.path);
    } catch (e) {
      throw "$e";
    }
  }
}
// This class after capture image it take to compressed image before return??
