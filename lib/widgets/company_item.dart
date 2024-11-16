import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:srbiau_digital_plaque/component/dimens.dart';
import 'package:srbiau_digital_plaque/component/extentions.dart';
import 'package:srbiau_digital_plaque/component/res/text_styles.dart';
import 'package:srbiau_digital_plaque/gen/assets.gen.dart';
import 'package:srbiau_digital_plaque/view/digital_Plaque.dart';
import 'package:srbiau_digital_plaque/view/company_list.dart';
import 'package:srbiau_digital_plaque/widgets/costum_textbutton.dart';

class CompanyItem extends StatelessWidget {
  const CompanyItem({
    super.key,
    required this.size,
    required this.widget,
  });

  final Size size;
  final CompanyList widget;

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: size.height * 0.21,
      width: double.infinity,
      margin: const EdgeInsets.fromLTRB(
          AppDimens.padding, AppDimens.small, AppDimens.padding, AppDimens.small),
      padding: const EdgeInsets.all(AppDimens.small),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(4)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          (size.height*0.0085).height,
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Text(
                    "گروه ۳۶۰ درجه",
                    style: AppTextStyles.tileTxtStyle,
                  ),
                  const Text(
                    "پلاک ۸۲",
                    style: AppTextStyles.descriptionStyle,
                  ),
                  AppDimens.xlarge.height,
                  const Text(
                    "مشاوره بازاریابی",
                    style: AppTextStyles.expansionTileChildren,
                  ),
                ],
              ),
              AppDimens.xlarge.width,
              Image.asset(
                Assets.png.imagePlaceH.path,
                height: size.height * 0.13,
              ),
            ],
          ),
          (size.height*0.0085).height,
          CostumTextButton(
            textButtonTitle: "اطلاعات بیشتر",
            onPressed: () {
              Get.to(DigitalPlaque(mainColor: widget.mainColor));
            },
          )
        ],
      ),
    );
  }
}
