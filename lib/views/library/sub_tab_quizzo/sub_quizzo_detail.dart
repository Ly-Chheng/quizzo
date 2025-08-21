import 'dart:developer';
import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizzo/controllers/library/camara_controller.dart';
import 'package:quizzo/controllers/library/genarate_pincode_qr_controller.dart';
import 'package:quizzo/controllers/library/quizzo_controller.dart';
import 'package:quizzo/controllers/more/share_controller.dart';
import 'package:quizzo/core/utils/app_color.dart';
import 'package:quizzo/core/utils/app_fonts.dart';
import 'package:quizzo/views/library/components/stats_card.dart';
import 'package:quizzo/views/library/components/view_quize_card.dart';
import 'package:quizzo/views/library/custom_image_view.dart';
import 'package:quizzo/views/library/sub_tab_quizzo/generate_qr_pin.dart';
import 'package:quizzo/widgets/animate_shimmerEffect.dart';
import 'package:quizzo/widgets/animated_button.dart';
import 'package:quizzo/widgets/custom_dropdown.dart';
import 'package:quizzo/widgets/section_reusable.dart';

class SubQuizzoDetail extends StatefulWidget {
  final ScrollController scrollController;
  final Function()? onDropDownClose;

  const SubQuizzoDetail(
      {super.key, required this.scrollController, this.onDropDownClose});

  @override
  State<SubQuizzoDetail> createState() => _SubQuizzoDetailState();
}

class _SubQuizzoDetailState extends State<SubQuizzoDetail> {
  final quizeController = Get.put(QuizzoController());
  TextEditingController titleController = TextEditingController();
  String? photoUrl;
  File? file;
  final theme = AppTheme();
  final camaraController = Get.put(CamaraController());
  final ShareController shareController = Get.put(ShareController());
  GlobalKey<CustomDropDownState> dropDownKey = GlobalKey<CustomDropDownState>();

  final List<CustDropdownMenuItem> dropdownItems = [
    CustDropdownMenuItem(
      value: 1,
      child: Text(
        'Only Me',
        style: TextStyle(
          fontFamily: AppFontStyle().fontebold,
          fontSize: Get.context!.isPhone ? 18 : 20,
        ),
      ),
    ),
    CustDropdownMenuItem(
      value: 2,
      child: Text(
        'Public',
        style: TextStyle(
          fontFamily: AppFontStyle().fontebold,
          fontSize: Get.context!.isPhone ? 18 : 20,
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                    Row(
                      children: [
                        IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.drive_file_rename_outline)),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.star_border_outlined)),
                        PopupMenuButton<String>(
                          onSelected: (value) {
                            if (value == 'share') {
                              final text = 'Check out this awesome quiz!';
                              final link =
                                  'https://www.example.com/quiz-detail';
                              shareController.share(text, link);
                            } else if (value == 'generate_pin') {
                              // Generate PIN using PinCodeController
                              final pinCodeController =
                                  Get.put(PinCodeQRController());
                              pinCodeController
                                  .generatePinCode(); // Generate the PIN

                              // Navigate to GenerateQRPinCode screen and pass the generated PIN
                              Get.to(() => GenerateQRPinCode(
                                  pinCode: pinCodeController.pinCode.value));
                            }
                          },
                          itemBuilder: (BuildContext context) => [
                            PopupMenuItem<String>(
                              value: 'share',
                              child: Row(
                                children: [
                                  Icon(Icons.share),
                                  SizedBox(width: 8),
                                  Text('Share'),
                                ],
                              ),
                            ),
                            PopupMenuItem<String>(
                              value: 'generate_pin',
                              child: Row(
                                children: [
                                  Icon(Icons.qr_code),
                                  SizedBox(width: 8),
                                  Text('Generate PIN & QR Code'),
                                ],
                              ),
                            ),
                          ],
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Colors
                                    .grey, // Adjust the color to your theme
                                width: 1,
                              ),
                            ),
                            child: Icon(Icons.more_horiz_outlined),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: double.infinity,
                      height: Get.height * 0.28,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(25),
                        child: CachedNetworkImage(
                          imageUrl:
                              'https://ahaslides.com/wp-content/uploads/2022/11/SEO1599thumb.png',
                          fit: BoxFit.cover,
                          placeholder: (context, url) => ShimmerEffect(),
                          errorWidget: (context, url, error) => Icon(
                              Icons.image_not_supported_outlined,
                              color: Colors.red),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text('Get Smarter And Better'.tr,
                        style: Style.headerTextStyleBold22_24(context)),
                    SizedBox(
                      height: 10,
                    ),
                    StatsCardReusable(),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: context.isPhone ? 35 : 40,
                          backgroundColor: Colors.white,
                          child: customImage(
                            imageUrl:
                                "https://img.freepik.com/free-psd/3d-rendering-avatar_23-2150833576.jpg",
                            width: context.isPhone
                                ? Get.height * 0.09
                                : Get.height * 0.1,
                            height: context.isPhone
                                ? Get.height * 0.09
                                : Get.height * 0.1,
                            isProfile: true,
                          ),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Keo Sreymomsak',
                                style: Style.subHeaderBold(context)),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              '@keosrey_m',
                              style: TextStyle(
                                  fontFamily: AppFontStyle().fontebold,
                                  fontSize:
                                      AppFontSize(context).descriptionLargeSize,
                                  color: AppColor().greyText),
                            ),
                          ],
                        ),
                        Spacer(),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              border: Border.all(
                                color: AppColor().primaryColor,
                                width: 2,
                              )),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 5),
                            child: Text('You'.tr),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text('Description'.tr, style: Style.subHeaderBold(context)),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                        'This is a back to school quizzo. Let is  make this game in your class to revive the classroom atmosphere after the holidays. Let have fun at school! 🔥',
                        style: Style.bodyText16_18(context)),
                    SizedBox(
                      height: 10,
                    ),
                    ReusableSectionTitle(
                      title: 'Questions'.tr,
                      onTap: () {
                        //
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: quizeController.questionquizeData_10.length,
                      itemBuilder: (context, index) {
                        final quiz =
                            quizeController.questionquizeData_10[index];
                        return viewQuizeCard(
                          context: context,
                          imageUrl: quiz['image']!,
                          title: quiz['title']!,
                          subtitle: quiz['sub']!,
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Divider(
              color: AppTheme().borderTheme,
              thickness: 1,
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15, right: 15, top: 10, bottom: 20),
              child: Row(
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
                      onPressed: () {},
                      child: Text(
                        'Play Solo'.tr,
                        style: Style.button(context)
                            .copyWith(color: AppColor().primaryColor),
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
                      onPressed: () {},
                      child: Text(
                        'Play with friends'.tr,
                        style: Style.button(context),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
