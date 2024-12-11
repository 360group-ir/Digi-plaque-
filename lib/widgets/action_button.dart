import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/svg.dart';
import 'package:share_plus/share_plus.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:srbiau_digital_plaque/component/dimens.dart';
import 'package:srbiau_digital_plaque/component/extentions.dart';
import 'package:srbiau_digital_plaque/component/res/app_colors.dart';
import 'package:srbiau_digital_plaque/gen/assets.gen.dart';

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

  Future<void> downloadVcf(
      String name, String org, String phone, String email) async {
    try {
      // ساخت محتوای VCF
      final vcfContent = """
BEGIN:VCARD
VERSION:3.0
FN:$name
ORG:$org
TEL:$phone
EMAIL:$email
END:VCARD
""";

      // ذخیره‌سازی فایل VCF
      final directory = await getApplicationDocumentsDirectory();
      final file = File('${directory.path}/contact.vcf');
      await file.writeAsString(vcfContent);

      // در اینجا می‌توانید از پکیج url_launcher برای باز کردن فایل استفاده کنید
      // یا از هر روش دیگری که مناسب است.
      // به عنوان مثال:
      // await OpenFile.open(file.path);
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
                onPressed: () async => await downloadVcf(
                    companyName, companyName, phoneNumber, email),
                icon: SvgPicture.asset(Assets.svg.save,
                    colorFilter: const ColorFilter.mode(
                        AppColors.neutralDarker, BlendMode.srcIn))),
          ],
        ),
      ),
    );
  }
}
