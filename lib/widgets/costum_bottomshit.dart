import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:srbiau_digital_plaque/component/dimens.dart';
import 'package:srbiau_digital_plaque/component/extentions.dart';
import 'package:srbiau_digital_plaque/component/res/app_colors.dart';
import 'package:srbiau_digital_plaque/component/res/app_text.dart';
import 'package:srbiau_digital_plaque/component/res/text_styles.dart';
import 'package:srbiau_digital_plaque/controller/eplak_controller.dart';
import 'package:srbiau_digital_plaque/gen/assets.gen.dart';
import 'package:url_launcher/url_launcher.dart';

// ignore: must_be_immutable
class CostumBottomShit extends StatelessWidget {
  CostumBottomShit({
    super.key, required this.code,
  });
final String code ;
  final Uri urlLoc = Uri.parse('https://maps.app.goo.gl/MBGHM2WZMhTNv8Fd7');
late final BusinessController businessController = Get.put(BusinessController(code));
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(4), topRight: Radius.circular(4))),
      height: size.height * 0.38,
      child: Padding(
        padding: const EdgeInsets.all(AppDimens.padding),
        child: Column(
          children: [
            Center(
              child: Container(
                height: 3,
                width: size.width * 0.3,
                decoration: const BoxDecoration(
                    color: AppColors.neutralDark,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
              ),
            ),
            AppDimens.small.height,
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Text(
                  AppText.address,
                  style: AppTextStyles.tileTxtStyle,
                ),
                AppDimens.medium.width,
                SvgPicture.asset(Assets.svg.icon1),
              ],
            ),
            (size.height * 0.035).height,
            Obx(() => businessController.isLoading.value
                ? Center(child: SpinKitCircle())
                : Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      ''' دانشگاه آزاد اسلامی واحد علوم وتحقیقات
کتابخانه دکتر حبیبی
طبقه ${businessController.businessData.value!.floor} - بلوک ${businessController.businessData.value!.block} - پلاک ${businessController.businessData.value!.unit}''',
                      // '''${businessController.businessData.value!.address}''',
                      maxLines: 3,
                      textDirection: TextDirection.rtl,
                      style:
                          AppTextStyles.tileChildrenStyle.copyWith(height: 2),
                    ),
                  )),
            (size.height * 0.035).height,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: size.width * 0.75,
                  height: size.width * 0.11,
                  decoration: BoxDecoration(
                      color: AppColors.neutralLight,
                      border: Border.all(color: AppColors.neutralDark),
                      borderRadius: BorderRadius.circular(4)),
                  child: TextButton(
                    onPressed: () async {
                      if (await canLaunchUrl(urlLoc)) {
                        await launchUrl(urlLoc);
                      } else {
                        Get.snackbar("Could not launch url", '',
                            backgroundColor: AppColors.primaryDefaultG,
                            animationDuration:
                                const Duration(milliseconds: 500));
                      }
                    },
                    child: const Center(
                        child: Text(
                      AppText.locationOnMap,
                      style: AppTextStyles.descriptionTitleStyle,
                      textDirection: TextDirection.rtl,
                    )),
                  ),
                ),
                const Expanded(child: SizedBox()),
                Container(
                  width: size.width * 0.11,
                  height: size.width * 0.11,
                  decoration: BoxDecoration(
                      color: AppColors.neutralLight,
                      border: Border.all(color: AppColors.neutralDark),
                      borderRadius: BorderRadius.circular(4)),
                  child: TextButton(
                    onPressed: () async {
                      await Clipboard.setData(
                           ClipboardData(text: ''' دانشگاه آزاد اسلامی واحد علوم وتحقیقات
کتابخانه دکتر حبیبی
طبقه ${businessController.businessData.value!.floor} - بلوک ${businessController.businessData.value!.block} - پلاک ${businessController.businessData.value!.unit}''',));
                      Get.snackbar("Copied", 'متن کپی شد',
                          backgroundColor: Colors.green,
                          duration: const Duration(seconds: 3));
                    },
                    child: Center(child: SvgPicture.asset(Assets.svg.copy)),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
