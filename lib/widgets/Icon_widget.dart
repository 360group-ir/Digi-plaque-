import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:srbiau_digital_plaque/component/dimens.dart';
import 'package:srbiau_digital_plaque/component/extentions.dart';
import 'package:srbiau_digital_plaque/component/res/app_colors.dart';
import 'package:srbiau_digital_plaque/component/res/text_styles.dart';
import 'package:url_launcher/url_launcher.dart';

// ignore: must_be_immutable
class IconWidget extends StatelessWidget {
  IconWidget({
    super.key,
    required this.assetsName,
    required this.text,
    this.ontap,
  });
  String assetsName;
  String text;
  final ontap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Column(
        children: [
          Container(
              height: 44,
              width: 44,
              decoration: const BoxDecoration(
                  color: AppColors.neutralLight,
                  borderRadius: BorderRadius.all(Radius.circular(4)),
                  boxShadow: [
                    BoxShadow(
                        color: AppColors.shadowColor1,
                        blurStyle: BlurStyle.outer,
                        offset: Offset(0, 0),
                        blurRadius: 5),
                    BoxShadow(
                        color: AppColors.shadowColor2,
                        blurStyle: BlurStyle.outer,
                        offset: Offset(0, 0),
                        blurRadius: 5),
                  ]),
              child: Padding(
                  padding: const EdgeInsets.all(AppDimens.small),
                  child: SvgPicture.asset(assetsName))),
          AppDimens.small.height,
          Text(
            text,
            style: AppTextStyles.expansionTileChildren,
          )
        ],
      ),
    );
  }
}

void sendEmail(String recipientEmail) async {
  const String subject = "موضوع ایمیل"; // موضوع ایمیل
  const String body = "سلام، این متن پیش‌فرض ایمیل است."; // متن ایمیل

  final Uri emailUri = Uri(
    scheme: 'mailto',
    path: recipientEmail,
    query: _encodeQueryParameters(<String, String>{
      'subject': subject,
      'body': body,
    }),
  );

  if (await canLaunchUrl(emailUri)) {
    await launchUrl(emailUri);
  } else {
    throw 'Could not launch $emailUri';
  }
}

String? _encodeQueryParameters(Map<String, String> params) {
  return params.entries
      .map((e) =>
          '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
      .join('&');
}
