import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/svg.dart';
import 'package:share_plus/share_plus.dart';
import 'package:srbiau_digital_plaque/component/dimens.dart';
import 'package:srbiau_digital_plaque/component/extentions.dart';
import 'package:srbiau_digital_plaque/component/res/app_colors.dart';
import 'package:srbiau_digital_plaque/gen/assets.gen.dart';
import 'dart:html' as html;

class ActionButton extends StatelessWidget {
  const ActionButton({
    super.key,
    required this.size,
    required this.companyName,
    required this.phoneNumber,
     this.email = '',
  });

  final Size size;
  final String companyName;
  final String phoneNumber;
  final String email;

  void saveVcfFile() {
    // ساخت محتوای فایل VCF
    final vcfContent = """
BEGIN:VCARD
VERSION:3.0
FN:$companyName
ORG:$companyName
TEL:$phoneNumber
EMAIL:$email
END:VCARD
""";

  try {
    // ساخت محتوای فایل VCF
    final bytes = Uint8List.fromList(vcfContent.codeUnits);
    final blob = html.Blob([bytes], 'text/vcard');

    // ایجاد لینک برای دانلود
    final url = html.Url.createObjectUrlFromBlob(blob);
    final anchor = html.AnchorElement(href: url)
      ..target = 'blank'
      ..download = 'contact.vcf' // نام فایل دانلودی
      ..click();
    html.Url.revokeObjectUrl(url); // آزاد کردن حافظه
  } catch (e) {
    print("Error while downloading VCF: $e");
  }
  }


  @override
  Widget build(BuildContext context) {
    return Animate(
      effects: const [
        ScaleEffect(duration: Durations.extralong1),
      ],
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: AppDimens.padding, vertical: AppDimens.xlarge),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
                onPressed: () async {
                  await Share.share(Uri.base.toString());
                  if (kDebugMode) {
                    print('Thank you for sharing my website!');
                  }
                },
                icon: SvgPicture.asset(
                  Assets.svg.share,
                  colorFilter: const ColorFilter.mode(
                      AppColors.neutralDarker, BlendMode.srcIn),
                )),
            (size.width * 0.05).width,
            IconButton(
                onPressed: saveVcfFile,
                icon: SvgPicture.asset(Assets.svg.save,
                    colorFilter: const ColorFilter.mode(
                        AppColors.neutralDarker, BlendMode.srcIn))),
          ],
        ),
      ),
    );
  }
}
