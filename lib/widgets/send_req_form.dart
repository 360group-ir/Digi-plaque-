import 'package:flutter/material.dart';
import 'package:srbiau_digital_plaque/component/dimens.dart';
import 'package:srbiau_digital_plaque/component/extentions.dart';
import 'package:srbiau_digital_plaque/component/res/app_text.dart';
import 'package:srbiau_digital_plaque/component/res/text_styles.dart';
import 'package:srbiau_digital_plaque/widgets/req_form_textFeild.dart';

class SendReqForm extends StatelessWidget {
  const SendReqForm({
    super.key,
    required this.color,
  });

  final Color color;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      // height: size.height * 0.60,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: AppDimens.small),
      margin: const EdgeInsets.symmetric(horizontal: AppDimens.padding),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(4)),
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: AppDimens.padding , vertical: AppDimens.medium),
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

          const ReqFormTextfeild(
            hintText: 'نام و نام خانوادگی ',
            maxLin: 1,
          ),

          const ReqFormTextfeild(
            hintText: ' شماره موبایل ',
            maxLin: 1,
          ),

          const ReqFormTextfeild(
            hintText: 'متن درخواست  ',
            maxLin: 12,
          ),
          (size.height * 0.025).height,

          Container(
            height: 48,
            width: double.infinity,
            margin: const EdgeInsets.symmetric(horizontal: AppDimens.medium),
            decoration: BoxDecoration(
                color: color, borderRadius: BorderRadius.circular(4)),
            child: TextButton(
              onPressed: () {},
              child: Text(
                AppText.sendReq,
                style: AppTextStyles.landingPage.copyWith(fontSize: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
