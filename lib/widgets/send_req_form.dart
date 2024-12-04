import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:srbiau_digital_plaque/component/dimens.dart';
import 'package:srbiau_digital_plaque/component/extentions.dart';
import 'package:srbiau_digital_plaque/component/res/app_colors.dart';
import 'package:srbiau_digital_plaque/component/res/app_text.dart';
import 'package:srbiau_digital_plaque/component/res/text_styles.dart';
import 'package:srbiau_digital_plaque/component/responsive.dart';
import 'package:srbiau_digital_plaque/controller/contact_us_controller.dart';
import 'package:srbiau_digital_plaque/widgets/req_form_textFeild.dart';

// ignore: must_be_immutable
class SendReqForm extends StatelessWidget {
  SendReqForm({
    super.key,
    required this.color,
  });

  final Color color;
  ContactUsController cUsController = Get.put(ContactUsController());
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: AppDimens.small),
      margin: const EdgeInsets.symmetric(horizontal: AppDimens.padding),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(4)),
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(
                AppDimens.padding, AppDimens.medium, AppDimens.padding, 0),
            child: Align(
              alignment: Alignment.centerRight,
              child: Text(
                AppText.sendReq,
                style: AppTextStyles.descriptionTitleStyle,
                textDirection: TextDirection.rtl,
              ),
            ),
          ),
          //Form

          ReqFormTextfeild(
            hintText: 'نام و نام خانوادگی ',
            maxLin: 1,
            controller: cUsController.emailController,
            inputType: TextInputType.name,
          ),

          ReqFormTextfeild(
            hintText: ' شماره موبایل ',
            maxLin: 1,
            controller: cUsController.mobileController,
            inputType: TextInputType.phone,
          ),

          ReqFormTextfeild(
            hintText: 'متن درخواست  ',
            maxLin: 10,
            controller: cUsController.contentController,
            inputType: TextInputType.multiline,
          ),
          (size.height * 0.025).height,

          Obx(() => Align(
                alignment: Responsive.isDesktop(context)
                    ? Alignment.centerLeft
                    : Alignment.center,
                child: Container(
                  height: 48,
                  width: 192,
                  margin:
                      const EdgeInsets.symmetric(horizontal: AppDimens.small),
                  decoration: BoxDecoration(
                      color: color, borderRadius: BorderRadius.circular(4)),
                  child: TextButton(
                    onPressed: cUsController.sendContactUs,
                    child: cUsController.isLoading.value
                        ? const SpinKitFoldingCube(
                            size: 28,
                            color: AppColors.neutralLight,
                          )
                        : Text(
                            AppText.sendReq,
                            style: AppTextStyles.landingPage
                                .copyWith(fontSize: 16),
                          ),
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
