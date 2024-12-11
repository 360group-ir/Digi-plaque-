import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:srbiau_digital_plaque/component/api_constant.dart';
import 'package:srbiau_digital_plaque/component/dimens.dart';
import 'package:srbiau_digital_plaque/component/extentions.dart';
import 'package:srbiau_digital_plaque/component/res/text_styles.dart';
import 'package:srbiau_digital_plaque/view/eplak.dart';
import 'package:srbiau_digital_plaque/widgets/costum_textbutton.dart';

class CompanyItem extends StatelessWidget {
  const CompanyItem({
    super.key,
    required this.title,
    required this.pelak,
    required this.field,
    required this.imgurl,
    // required this.widget,
  });

  final String title;
  final String pelak;
  final String field;
  final String imgurl;

  // final CompanyList widget;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.fromLTRB(AppDimens.padding, AppDimens.small,
          AppDimens.padding, AppDimens.small),
      padding: const EdgeInsets.all(AppDimens.small),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(4)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          (size.height * 0.0085).height,
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    title,
                    style: AppTextStyles.tileTxtStyle,
                  ),
                  Text(
                    "پلاک $pelak",
                    style: AppTextStyles.descriptionStyle,
                  ),
                  AppDimens.xlarge.height,
                  Text(
                    field,
                    style: AppTextStyles.expansionTileChildren,
                  ),
                ],
              ),
              AppDimens.xlarge.width,
              SizedBox(
                  height: size.height * 0.131,
                  width: size.height * 0.131,
                  child: CachedNetworkImage(
                    imageUrl: ApiConstant.dowloadurl + imgurl,
                    height: size.height * 0.13,
                  ))
            ],
          ),
          (size.height * 0.0085).height,
          CostumTextButton(
            // width: 192,
            textButtonTitle: "اطلاعات بیشتر",
            onPressed: () {
              // Get.toNamed(RouteName.routeEpelak);
              Get.to(Eplak( code: pelak));
            },
          )
        ],
      ),
    );
  }
}
