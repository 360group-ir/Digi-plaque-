// ignore: file_names
import 'package:flutter/material.dart';
import 'package:srbiau_digital_plaque/component/dimens.dart';
import 'package:srbiau_digital_plaque/component/res/text_styles.dart';

class ExpanGroup extends StatelessWidget {
  const ExpanGroup({
    super.key,
    required this.title,
    required this.children,
    required this.mainColor, required this.expantileOpen,
  });
  final String title;
  final List<Widget> children;
  final Color mainColor;
  final bool expantileOpen;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
          AppDimens.padding, AppDimens.medium, AppDimens.padding, 0),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(4)),
        child: ExpansionTile(
          clipBehavior: Clip.hardEdge,
          title: Text(
            title,
            textDirection: TextDirection.rtl,
            textAlign: TextAlign.right,
            style: AppTextStyles.tileTxtStyle,
          ),
          tilePadding: const EdgeInsets.symmetric(horizontal: AppDimens.small),
          initiallyExpanded: expantileOpen,
          childrenPadding: const EdgeInsets.fromLTRB(AppDimens.medium,
              AppDimens.small, AppDimens.medium, AppDimens.small),
          expansionAnimationStyle: AnimationStyle(
            duration: const Duration(milliseconds: 600),
          ),
          iconColor: mainColor,
          collapsedIconColor: Colors.black,
          children: children,
        ),
      ),
    );
  }
}
