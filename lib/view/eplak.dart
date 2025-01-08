import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:srbiau_digital_plaque/component/api_constant.dart';
import 'package:srbiau_digital_plaque/component/dimens.dart';
import 'package:srbiau_digital_plaque/component/extentions.dart';
import 'package:srbiau_digital_plaque/component/res/app_colors.dart';
import 'package:srbiau_digital_plaque/component/res/app_text.dart';
import 'package:srbiau_digital_plaque/component/res/text_styles.dart';
import 'package:srbiau_digital_plaque/component/responsive.dart';
import 'package:srbiau_digital_plaque/controller/eplak_controller.dart';
import 'package:srbiau_digital_plaque/gen/assets.gen.dart';
import 'package:srbiau_digital_plaque/widgets/Expan_Gruope.dart';
import 'package:srbiau_digital_plaque/widgets/Icon_widget.dart';
import 'package:srbiau_digital_plaque/widgets/action_button.dart';
import 'package:srbiau_digital_plaque/widgets/costum_bottomshit.dart';
import 'package:srbiau_digital_plaque/widgets/costum_drawer.dart';
import 'package:srbiau_digital_plaque/widgets/requierment_widget.dart';
import 'package:url_launcher/url_launcher.dart';

// ignore: must_be_immutable
class Eplak extends StatelessWidget {
  Eplak({
    super.key,
    // required this.code,
  });

  String pelak = Get.parameters['pelak']!;
  late final BusinessController businessController =
      Get.put(BusinessController(pelak));
  final Color mainColor = AppColors.primaryPelak;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // final data = businessController.businessData.value!;

    return SafeArea(
        child: Scaffold(
      backgroundColor: AppColors.neutralLight,
      drawer: const CustomDrawer(),
      appBar: PreferredSize(
          preferredSize: Size(size.width, size.height * 0.0866),
          child: Container(
            height: size.height * 0.085,
            color: mainColor,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: AppDimens.padding),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: const Icon(
                        CupertinoIcons.left_chevron,
                        color: AppColors.neutralLight,
                      )),
                  IconButton(
                      onPressed: () {
                        // showFullScreenDrawer(context);
                        showCenteredDialog(context);
                      },
                      icon: SvgPicture.asset(Assets.svg.group)),
                ],
              ),
            ),
          )),
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(parent: BouncingScrollPhysics()),
        child: Obx(
          () => businessController.isLoading.value
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    (size.height * 0.40).height,
                    Center(
                      child: SpinKitFoldingCube(
                        color: mainColor,
                      ),
                    ),
                  ],
                )
              : Column(
                  children: [
                    //Qr code groupe
                    Container(
                      color: mainColor,
                      width: size.width,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          (size.height * 0.03).height,
                          CachedNetworkImage(
                            imageUrl: ApiConstant.dowloadurl +
                                businessController.businessData.value!.logo,
                            height: size.height * 0.15,
                          ),
                          (size.height * 0.04).height,
                          Text(
                            businessController.businessData.value!.name,
                            style: AppTextStyles.titleStyleB
                                .copyWith(color: Colors.white),
                          ),
                          (size.height * 0.04).height,
                          QrImageView(
                            data: Uri.base.toString(),
                            version: QrVersions.auto,
                            size: size.height * 0.13,
                            dataModuleStyle: const QrDataModuleStyle(
                                dataModuleShape: QrDataModuleShape.square,
                                color: Colors.white),
                            eyeStyle: const QrEyeStyle(
                              eyeShape: QrEyeShape.square,
                              color: Colors.white,
                            ),
                          ),
                          (size.height * 0.03).height
                        ],
                      ),
                    ),
                    ConstrainedBox(
                      constraints: BoxConstraints(
                          maxWidth: Responsive.isDesktop(context)
                              ? 1080
                              : size.width),
                      child: Column(
                        children: [
                          //List tiles
                          //contact us
                          Padding(
                            padding: const EdgeInsets.fromLTRB(
                              AppDimens.padding,
                              AppDimens.padding,
                              AppDimens.padding,
                              AppDimens.small,
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(4)),
                              child: Padding(
                                padding:
                                    const EdgeInsets.all(AppDimens.padding),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          Responsive.isMobile(context)
                                              ? MainAxisAlignment.spaceBetween
                                              : MainAxisAlignment.spaceEvenly,
                                      children: [
                                        IconWidget(
                                          ontap: () {
                                            makePhoneCall(
                                                'tel:+${businessController.businessData.value!.ceo.phone}');
                                          },
                                          assetsName: Assets.svg.smartphone,
                                          text: AppText.mobile,
                                        ),
                                        IconWidget(
                                          ontap: () {
                                            makePhoneCall(
                                                'tel:${businessController.businessData.value!.phone}');
                                          },
                                          assetsName: Assets.svg.vector,
                                          text: AppText.phone,
                                        ),
                                        IconWidget(
                                          ontap: () {
                                            sendEmail(businessController
                                                .businessData.value!.email
                                                .toString());
                                          },
                                          assetsName: Assets.svg.icon2,
                                          text: AppText.email,
                                        ),
                                        IconWidget(
                                          assetsName: Assets.svg.icon,
                                          text: AppText.website,
                                          ontap: () {
                                            launchURL(businessController
                                                .businessData.value!.website
                                                .toString());
                                          },
                                        ),
                                        IconWidget(
                                          assetsName: Assets.svg.icon1,
                                          text: AppText.address,
                                          ontap: () {
                                            Get.bottomSheet(
                                                isDismissible: true,
                                                enterBottomSheetDuration:
                                                    const Duration(
                                                        milliseconds: 400),
                                                exitBottomSheetDuration:
                                                    const Duration(
                                                        milliseconds: 300),
                                                CostumBottomShit(
                                                  code: pelak,
                                                ));
                                          },
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),

                          // about us
                          Animate(
                            effects: const [MoveEffect()],
                            child: ExpanGroup(
                              mainColor: mainColor,
                              title: "درباره ما ",
                              expantileOpen: true,
                              children: [
                                Text(
                                  businessController
                                      .businessData.value!.description,
                                  style: AppTextStyles.descriptionStyle
                                      .copyWith(height: 2),
                                  textDirection: TextDirection.rtl,
                                  textAlign: TextAlign.right,
                                )
                              ],
                            ),
                          ),
                          // working hours
                          Animate(
                              effects: const [MoveEffect()],
                              child: ExpanGroup(
                                  title: "ساعت کار",
                                  mainColor: mainColor,
                                  expantileOpen: false,
                                  children: [
                                    RequiermentList(
                                        items: businessController
                                            .businessData.value!.workingHours)
                                  ])),

                          //Share button
                          ActionButton(
                            size: size,
                            companyName: businessController
                                .businessData.value!.name
                                .toString(),
                            phoneNumber:
                                businessController.businessData.value!.phone,
                            email: businessController.businessData.value!.email
                                .toString(),
                          ),
                        ],
                      ),
                    ),

                    (size.height * 0.015).height,
                    //footer
                    Padding(
                      padding: const EdgeInsets.all(AppDimens.padding),
                      child: SvgPicture.asset(
                        Assets.svg.loogo,
                        height: size.height * 0.2,
                        colorFilter: const ColorFilter.mode(
                            Color.fromARGB(255, 178, 178, 178),
                            BlendMode.srcIn),
                      ),
                    ),
                  ],
                ),
        ),
      ),
    ));
  }
}

void makePhoneCall(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    print('Could not launch $url');
  }
}

void launchURL(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    if (kDebugMode) {
      print('Could not launch $url');
    }
  }
}
