import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:share_plus/share_plus.dart';
import 'package:srbiau_digital_plaque/component/dimens.dart';
import 'package:srbiau_digital_plaque/component/extentions.dart';
import 'package:srbiau_digital_plaque/component/res/app_colors.dart';
import 'package:srbiau_digital_plaque/component/res/app_text.dart';
import 'package:srbiau_digital_plaque/component/res/text_styles.dart';
import 'package:srbiau_digital_plaque/controller/eplak_controller.dart';
import 'package:srbiau_digital_plaque/gen/assets.gen.dart';
import 'package:srbiau_digital_plaque/widgets/Expan_Gruope.dart';
import 'package:srbiau_digital_plaque/widgets/Icon_widget.dart';
import 'package:srbiau_digital_plaque/widgets/costum_bottomshit.dart';
import 'package:srbiau_digital_plaque/widgets/costum_drawer.dart';
import 'package:srbiau_digital_plaque/widgets/requierment_widget.dart';
import 'package:url_launcher/url_launcher.dart';

// ignore: must_be_immutable
class Eplak extends StatelessWidget {
  Eplak({
    super.key,
    required this.mainColor,
    required this.visiblity,
  });

  BusinessController businessController = Get.put(BusinessController());
  final Color mainColor;
  bool visiblity;
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
                          SvgPicture.asset(
                            Assets.svg.groper360,
                            height: size.height * 0.065,
                          ),
                          (size.height * 0.06).height,
                          Text(
                            businessController.businessData.value!.name,
                            style: AppTextStyles.titleStyleB
                                .copyWith(color: Colors.white),
                          ),
                          (size.height * 0.06).height,
                          QrImageView(
                            data: Uri.base.toString(),
                            version: QrVersions.auto,
                            size: size.height * 0.15,
                            dataModuleStyle: const QrDataModuleStyle(
                                dataModuleShape: QrDataModuleShape.square,
                                color: Colors.white),
                            eyeStyle: const QrEyeStyle(
                              eyeShape: QrEyeShape.square,
                              color: Colors.white,
                            ),
                          ),
                          (size.height * 0.032).height
                        ],
                      ),
                    ),

                    //List tiles
                    //contact us
                    Padding(
                      padding: const EdgeInsets.fromLTRB(AppDimens.padding,
                          AppDimens.padding, AppDimens.padding, 0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(4)),
                        child: Padding(
                          padding: const EdgeInsets.all(AppDimens.padding),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  IconWidget(
                                    ontap: () {
                                      _makePhoneCall(
                                          'tel:+${businessController.businessData.value!.ceo.phone}');
                                    },
                                    assetsName: Assets.svg.smartphone,
                                    text: AppText.mobile,
                                  ),
                                  IconWidget(
                                    ontap: () {
                                      _makePhoneCall(
                                          'tel:+${businessController.businessData.value!.phone}');
                                    },
                                    assetsName: Assets.svg.vector,
                                    text: AppText.phone,
                                  ),
                                  IconWidget(
                                    assetsName: Assets.svg.icon,
                                    text: AppText.website,
                                    ontap: () {
                                      _launchURL(
                                          "https://${businessController.businessData.value!.website.toString()}");
                                    },
                                  ),
                                  IconWidget(
                                    assetsName: Assets.svg.icon1,
                                    text: AppText.address,
                                    ontap: () {
                                      Get.bottomSheet(
                                          isDismissible: true,
                                          enterBottomSheetDuration:
                                              const Duration(milliseconds: 400),
                                          exitBottomSheetDuration:
                                              const Duration(milliseconds: 300),
                                          CostumBottomShit());
                                    },
                                  ),
                                ],
                              ),
                              (AppDimens.padding * 2).height,
                              IconWidget(
                                  assetsName: Assets.svg.icon2,
                                  text: AppText.email)
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
                        children: [
                          Text(
                            businessController.businessData.value!.description,
                            style: AppTextStyles.descriptionStyle
                                .copyWith(height: 2),
                            textDirection: TextDirection.rtl,
                            textAlign: TextAlign.justify,
                            locale: const Locale("fa"),
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
                            children: [RequiermentList()])),

                    //Share button
                    //TODO
                    Animate(
                      effects: const [
                        ScaleEffect(duration: Durations.extralong1),
                      ],
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: AppDimens.padding,
                            vertical: AppDimens.xlarge),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                                onPressed: () async {
                                  await Share.share(AppText.shareDesc);
                                },
                                icon: SvgPicture.asset(
                                  Assets.svg.share,
                                  colorFilter: const ColorFilter.mode(
                                      AppColors.neutralDarker, BlendMode.srcIn),
                                )),
                            AppDimens.medium.width,
                            IconButton(
                                onPressed: () {},
                                icon: SvgPicture.asset(Assets.svg.lang,
                                    colorFilter: const ColorFilter.mode(
                                        AppColors.neutralDarker,
                                        BlendMode.srcIn))),
                            AppDimens.medium.width,
                            IconButton(
                                onPressed: () {},
                                icon: SvgPicture.asset(Assets.svg.save,
                                    colorFilter: const ColorFilter.mode(
                                        AppColors.neutralDarker,
                                        BlendMode.srcIn))),
                          ],
                        ),
                      ),
                    ),

                    (size.height * 0.015).height,
                    //footer
                    Padding(
                      padding: const EdgeInsets.all(AppDimens.medium),
                      child: SvgPicture.asset(
                        Assets.svg.groper360,
                        height: size.height * 0.035,
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

  void _makePhoneCall(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      print('Could not launch $url');
    }
  }

  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      print('Could not launch $url');
    }
  }
}
