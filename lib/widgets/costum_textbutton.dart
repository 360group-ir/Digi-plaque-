import 'package:flutter/material.dart';
import 'package:srbiau_digital_plaque/component/dimens.dart';
import 'package:srbiau_digital_plaque/component/res/app_colors.dart';
import 'package:srbiau_digital_plaque/component/res/text_styles.dart';

class CostumTextButton extends StatelessWidget {
  const CostumTextButton({
    super.key,
    required this.textButtonTitle, this.onPressed,
  });
  final String textButtonTitle;
  final onPressed ;
  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppDimens.small),
      child: Container(
        height:48,
        decoration: BoxDecoration(
              color: AppColors.neutralLight,
              border: Border.all(color: AppColors.neutralDark),
              borderRadius: BorderRadius.circular(4)),
        child: TextButton(
          onPressed: onPressed,
          child:  Center(
                child: Text(
              textButtonTitle,
              style: AppTextStyles.descriptionTitleStyle,
              textDirection: TextDirection.rtl,
            )),
        ),
      ),
    );
  }
}
