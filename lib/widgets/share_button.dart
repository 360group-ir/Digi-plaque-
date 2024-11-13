import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:srbiau_digital_plaque/component/dimens.dart';
import 'package:srbiau_digital_plaque/component/res/app_colors.dart';
import 'package:srbiau_digital_plaque/component/res/app_text.dart';
import 'package:srbiau_digital_plaque/component/res/text_styles.dart';

class ShareButton extends StatelessWidget {
  const ShareButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppDimens.padding),
      child: Container(
        height: 48,
        decoration: BoxDecoration(
            color: AppColors.neutralLight,
            border: Border.all(color: AppColors.neutralDark),
            borderRadius: BorderRadius.circular(4),
            boxShadow: const [
              BoxShadow(
                  color: AppColors.shadowColor2,
                  offset: Offset(0, 1),
                  blurRadius: 4),
              BoxShadow(
                  color: AppColors.shadowColor2,
                  offset: Offset(0, 1),
                  blurRadius: 4)
            ]),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(4, 0, 4, 0),
          child: TextButton(
            onPressed: () async {
              await Share.share(AppText.shareDesc);
              if (kDebugMode) {
                print('Thank you for sharing my website!');
              }
            },
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  CupertinoIcons.share,
                  color: AppColors.neutralDarker,
                ),
                Text(
                  "اشتراک گذاری پلاک",
                  style: AppTextStyles.descriptionTitleStyle,
                  textDirection: TextDirection.rtl,
                ),
                SizedBox(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
