import 'dart:developer';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:quizzo/controllers/library/camara_controller.dart';
import 'package:quizzo/core/utils/app_color.dart';
import 'package:quizzo/core/utils/app_fonts.dart';
import 'package:quizzo/core/utils/popup_dialog.dart';
import 'package:quizzo/widgets/animated_button.dart';
import 'package:quizzo/widgets/custom_dropdown.dart';
import 'package:quizzo/widgets/custom_textfield.dart';

class CreateCollection extends StatefulWidget {
  final ScrollController scrollController;
  final Function()? onDropDownClose;

  const CreateCollection(
      {super.key, required this.scrollController, this.onDropDownClose});

  @override
  State<CreateCollection> createState() => _CreateCollectionState();
}

class _CreateCollectionState extends State<CreateCollection> {
  TextEditingController titleController = TextEditingController();
  String? photoUrl;
  File? file;
  final theme = AppTheme();
  final camaraController = Get.put(CamaraController());
  GlobalKey<CustomDropDownState> dropDownKey = GlobalKey<CustomDropDownState>();

  final List<CustDropdownMenuItem> dropdownItems = [
    CustDropdownMenuItem(
      value: 1,
      child: Text(
        'Only Me',
        style: TextStyle(
          fontFamily: AppFontStyle().fontebold,
          fontSize: Get.context!.isPhone ? 20 : 22,
        ),
      ),
    ),
    CustDropdownMenuItem(
      value: 2,
      child: Text(
        'Public',
        style: TextStyle(
          fontFamily: AppFontStyle().fontebold,
          fontSize: Get.context!.isPhone ? 20 : 22,
        ),
      ),
    ),
  ];

  void onItemChanged(value) {
    log('Selected value: $value');
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
        dropDownKey.currentState?.removeOverlay();
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.close,
                        size: Get.context!.isPhone ? 30 : 40,
                        color: theme.iconTheme,
                      ),
                      onPressed: () {
                        Get.back();
                      },
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Create New Collection',
                        style: TextStyle(
                          fontFamily: AppFontStyle().fontebold,
                          fontSize: Get.context!.isPhone ? 22 : 24,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () async {
                    if (file == null || !file!.existsSync()) {
                      cupertinoUpdateModal(context);
                    } else {}
                  },
                  child: Container(
                    width: double.infinity,
                    height: Get.height * 0.26,
                    decoration: BoxDecoration(
                      color: file == null || !file!.existsSync()
                          ? Theme.of(context).scaffoldBackgroundColor
                          : null,
                      borderRadius: BorderRadius.circular(20),
                      border: file == null || !file!.existsSync()
                          ? Border.all(color: AppColor().primaryColor, width: 1)
                          : null,
                      image: file != null && file!.existsSync()
                          ? DecorationImage(
                              image: FileImage(file!) as ImageProvider,
                              fit: BoxFit.cover,
                            )
                          : null,
                    ),
                    child: file == null || !file!.existsSync()
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.perm_media_outlined,
                                size: 40,
                                color: AppColor().primaryColor,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Add Cover Photo',
                                style: TextStyle(
                                  fontFamily: AppFontStyle().fontebold,
                                  fontSize: Get.context!.isPhone ? 16 : 18,
                                  color: AppColor().primaryColor,
                                ),
                              ),
                            ],
                          )
                        : Stack(
                            alignment: Alignment.center,
                            children: [
                              Positioned(
                                bottom: 10,
                                right: 10,
                                child: IconButton(
                                  icon: Icon(
                                    Icons.drive_file_rename_outline_sharp,
                                    color: Colors.white,
                                    size: 30,
                                  ),
                                  onPressed: () {
                                    cupertinoUpdateModal(context);
                                  },
                                ),
                              ),
                            ],
                          ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Title'.tr,
                  style: TextStyle(
                    fontFamily: AppFontStyle().fontebold,
                    fontSize: Get.context!.isPhone ? 16 : 18,
                  ),
                ),
                CustomTextField(
                  controller: titleController,
                  hintText: 'Enter a Collection Title',
                  keyboardType: TextInputType.text,
                  obscureText: false,
                  readOnly: false,
                  maxLines: 1,
                  isRequired: true,
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 10,
                  ),
                  onChanged: (value) {
                    log('Input value: $value');
                  },
                  textSize: Get.context!.isPhone ? 20 : 22,
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Visible to'.tr,
                  style: TextStyle(
                    fontFamily: AppFontStyle().fontebold,
                    fontSize: Get.context!.isPhone ? 16 : 18,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                CustomDropDown<int>(
                  key: dropDownKey,
                  items: dropdownItems,
                  onChanged: onItemChanged,
                  hintText: 'Select',
                  hintStyle: TextStyle(
                    fontSize: context.isPhone ? 16 : 18,
                    fontFamily: AppFontStyle().fontebold,
                    color: AppColor().greyText,
                  ),
                  maxListHeight: 250,
                  defaultSelectedIndex: 0,
                  isBorderDropMenu: true,
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Divider(
              color: AppTheme().borderTheme,
              thickness: 1,
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 20, right: 20, bottom: 20, top: 10),
              child: AnimatedButton(
                height: (Get.context?.isPhone ?? true) ? 50 : 60,
                color: AppColor().primaryColor,
                borderRadius: 25,
                shadowDegree: ShadowDegree.dark,
                duration: 100,
                enabled: true,
                onPressed: () {},
                child: Text(
                  'Create'.tr,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: (Get.context?.isPhone ?? true) ? 16 : 18,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Roboto',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<dynamic> cupertinoUpdateModal(BuildContext context) {
    return showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) => CupertinoActionSheet(
        actions: <Widget>[
          CupertinoActionSheetAction(
            onPressed: () async {
              log('CAMERA');
              await Permission.camera.request();
              if (await Permission.camera.isGranted) {
                final File? compressedImage =
                    await camaraController.captureAndCompressImage(
                        // ignore: use_build_context_synchronously
                        context);
                if (compressedImage != null) {
                  file = compressedImage;
                  setState(() {});
                } else {
                  //log('No image captured');
                }
              } else {
                PopupDialog.openAppSetting(
                  context,
                  title: 'Required Permission for Camera'.tr,
                  buttonText: 'Open Settings',
                  openSettingsAction: () async {
                    log("Open Settings Action case else");
                    await openAppSettings();
                  },
                );
              }
            },
            child: Text(
              'Open Camera'.tr,
              style: TextStyle(
                color: AppColor().infoColor,
                fontSize: context.isPhone ? 14 : 16,
                fontFamily: Get.locale == const Locale('km', 'KM')
                    ? 'KH-REGULAR'
                    : 'EN-REGULAR',
              ),
            ),
          ),
          CupertinoActionSheetAction(
            onPressed: () async {
              await Permission.photos.request();
              if (await Permission.photos.isGranted) {
                final File? compressedImage =
                    await camaraController.getImageFromGalleryAndCompress(
                        // ignore: use_build_context_synchronously
                        context);
                if (compressedImage != null) {
                  file = compressedImage;
                  setState(() {});
                } else {
                  //log('No image captured');
                }
              } else {
                PopupDialog.openAppSetting(
                  context,
                  title: 'Required Permission for Gallery'.tr,
                  // description:
                  //     'Please turn on photos permission.',
                  buttonText: 'Open Settings',
                  openSettingsAction: () async {
                    await openAppSettings();
                  },
                );
              }
            },
            child: Text(
              'Open Gallery'.tr,
              style: TextStyle(
                color: AppColor().infoColor,
                fontSize: context.isPhone ? 14 : 16,
                fontFamily: Get.locale == const Locale('km', 'KM')
                    ? 'KH-REGULAR'
                    : 'EN-REGULAR',
              ),
            ),
          ),
        ],
        cancelButton: CupertinoActionSheetAction(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text(
            'Cancel'.tr,
            style: TextStyle(
              color: AppColor().errorColor,
              fontSize: context.isPhone ? 16 : 18,
              fontFamily: Get.locale == const Locale('km', 'KM')
                  ? 'KH-REGULAR'
                  : 'EN-REGULAR',
            ),
          ),
        ),
      ),
    );
  }
}
