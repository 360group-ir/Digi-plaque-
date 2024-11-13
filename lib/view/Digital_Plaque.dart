import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:srbiau_digital_plaque/component/dimens.dart';
import 'package:srbiau_digital_plaque/component/extentions.dart';
import 'package:srbiau_digital_plaque/component/res/app_colors.dart';
import 'package:srbiau_digital_plaque/component/res/app_text.dart';
import 'package:srbiau_digital_plaque/component/res/text_styles.dart';
import 'package:srbiau_digital_plaque/gen/assets.gen.dart';
import 'package:srbiau_digital_plaque/widgets/Expan_Gruope.dart';
import 'package:srbiau_digital_plaque/widgets/Icon_widget.dart';
import 'package:srbiau_digital_plaque/widgets/costum_bottomshit.dart';
import 'package:srbiau_digital_plaque/widgets/costum_drawer.dart';
import 'package:srbiau_digital_plaque/widgets/requierment_widget.dart';
import 'package:srbiau_digital_plaque/widgets/share_button.dart';

// ignore: must_be_immutable
class DigitalPlaque extends StatefulWidget {
  DigitalPlaque({
    super.key,
    this.visiblity = false,
    required this.mainColor,
    // required this.imgUrl,
    // required this.qrcode,
    // required this.abouteUS,
    // required this.workinghourse,
    // required this.address,
    // required this.locationUrl,
    // required this.contactUs
  });

  final Color mainColor;
  bool visiblity;

  @override
  State<DigitalPlaque> createState() => _DigitalPlaqueState();
}

class _DigitalPlaqueState extends State<DigitalPlaque> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      backgroundColor: AppColors.neutralLight,
      drawer: const CustomDrawer(),
      appBar: PreferredSize(
          preferredSize: Size(size.width, size.height * 0.0866),
          child: Container(
            height: size.height * 0.085,
            color: widget.mainColor,
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
        child: Column(
          children: [
            //Qr code groupe
            Container(
              color: widget.mainColor,
              // height: size.height * 0.4,
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
                    "جزییات مهمه",
                    style:
                        AppTextStyles.titleStyleB.copyWith(color: Colors.white),
                  ),
                  (size.height * 0.06).height,
                  Image.asset(
                    Assets.png.qrcode.path,
                    height: size.height * 0.13,
                  ),
                  (size.height * 0.032).height
                ],
              ),
            ),

            //List tiles
            //contact us
            Padding(
              padding: const EdgeInsets.fromLTRB(
                  AppDimens.padding, AppDimens.padding, AppDimens.padding, 0),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(4)),
                child: Padding(
                  padding: const EdgeInsets.all(AppDimens.padding),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          IconWidget(
                            assetsName: Assets.svg.smartphone,
                            text: AppText.mobile,
                          ),
                          IconWidget(
                            assetsName: Assets.svg.vector,
                            text: AppText.phone,
                          ),
                          IconWidget(
                            assetsName: Assets.svg.icon,
                            text: AppText.website,
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                Get.bottomSheet(
                                    isDismissible: true,
                                    enterBottomSheetDuration:
                                        const Duration(milliseconds: 400),
                                    exitBottomSheetDuration:
                                        const Duration(milliseconds: 300),
                                     CostumBottomShit());
                              });
                            },
                            child: IconWidget(
                              assetsName: Assets.svg.icon1,
                              text: AppText.address,
                            ),
                          ),
                        ],
                      ),
                      (AppDimens.padding * 2).height,
                      IconWidget(
                          assetsName: Assets.svg.icon2, text: AppText.email)
                    ],
                  ),
                ),
              ),
            ),

            // about us
            Animate(
              effects: const [MoveEffect()],
              child: ExpanGroup(
                mainColor: widget.mainColor,
                title: "درباره ما ",
                children: [
                  Text(
                    AppText.lorem,
                    style: AppTextStyles.descriptionStyle.copyWith(height: 2),
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
                    mainColor: widget.mainColor,
                    children: [RequiermentList()])),

            Animate(
              effects: const [
                ScaleEffect(duration: Durations.long4),
              ],
              child: const Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: AppDimens.padding, vertical: AppDimens.padding),
                child: ShareButton(),
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
                    Color.fromARGB(255, 178, 178, 178), BlendMode.srcIn),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
