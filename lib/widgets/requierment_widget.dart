import 'package:flutter/material.dart';
import 'package:srbiau_digital_plaque/component/dimens.dart';
import 'package:srbiau_digital_plaque/component/extentions.dart';
import 'package:srbiau_digital_plaque/component/res/text_styles.dart';


class RequiermentList extends StatelessWidget {
   RequiermentList({
    super.key,
    // required List<String> items,
  }) ;


    final List<String> _items = [
      'شنبه تا چهارشنبه - ۹ الی ۱۶',
      'پنج‌شنبه - ۹ الی ۱۲'
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: 4),
        child: Column(
          children: [
            ListTile(
                minVerticalPadding: AppDimens.small,
                minTileHeight: 10,
                minLeadingWidth: 12,
                trailing: const Icon(
                  Icons.circle,
                  size: 4,
                  color: Colors.black,
                ),
                title: Text(
                  _items[0],
                  textDirection: TextDirection.rtl,
                  style: AppTextStyles.descriptionStyle,
                ),
              ),
            ListTile(
              minVerticalPadding: AppDimens.small,
              minTileHeight: 10,
              minLeadingWidth: 12,
              trailing: const Icon(
                Icons.circle,
                size: 4,
                color: Colors.black,
              ),
              title: Text(
                _items[1],
                textDirection: TextDirection.rtl,
                style: AppTextStyles.descriptionStyle,
              ),
            ),
            
            AppDimens.small.height
          ],
        ));
  }
}