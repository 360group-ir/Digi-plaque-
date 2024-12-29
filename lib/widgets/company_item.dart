import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:srbiau_digital_plaque/component/api_constant.dart';
import 'package:srbiau_digital_plaque/component/dimens.dart';
import 'package:srbiau_digital_plaque/component/extentions.dart';
import 'package:srbiau_digital_plaque/component/res/app_colors.dart';
import 'package:srbiau_digital_plaque/component/res/text_styles.dart';
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
                    overflow: TextOverflow.fade,
                  ),
                  Text(
                    " $pelak پلاک",
                    style: AppTextStyles.descriptionStyle,
                  ),
                  AppDimens.xlarge.height,
                  Text(
                    field,
                    style: AppTextStyles.expansionTileChildren,
                    overflow: TextOverflow.fade,
                    softWrap: false,
                    maxLines: 2,
                  ),
                ],
              ),
              AppDimens.large.width,
              CachedNetworkImage(
                imageUrl: "${ApiConstant.dowloadurl}$imgurl",
                fit: BoxFit.cover,
                height: size.height * 0.131,
                width: size.height * 0.131,
                placeholder: (context, url) {
                  return const Center(
                    child:  SpinKitFoldingCube(
                      color: AppColors.primaryPelak,
                    ),
                  );
                },
                errorWidget: (context, url, error) {
                  return SizedBox(height: size.height * 0.131,
                width: size.height * 0.131,child: const Icon(Icons.error));
                },
              ),
            ],
          ),
          (size.height * 0.0085).height,
          CostumTextButton(
            textButtonTitle: "اطلاعات بیشتر",
            onPressed: () {
              Get.toNamed("/$pelak");
            },
          )
        ],
      ),
    );
  }
}
