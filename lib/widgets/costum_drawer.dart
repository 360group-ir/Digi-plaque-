import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:srbiau_digital_plaque/component/dimens.dart';
import 'package:srbiau_digital_plaque/component/res/text_styles.dart';
import 'package:srbiau_digital_plaque/gen/assets.gen.dart';
import 'package:srbiau_digital_plaque/main.dart';
import 'package:srbiau_digital_plaque/view/all_compines.dart';
import 'package:srbiau_digital_plaque/view/contact_us.dart';
// import 'package:srbiau_digital_plaque/view/searchtest.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Animate(
      effects: const [
        ScaleEffect(
          duration: Duration(milliseconds: 500),
        ),
        FadeEffect(duration: Duration(milliseconds: 500))
      ],
      child: Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        backgroundColor: Colors.transparent,
        child: Container(
          width: size.width,
          height: size.height,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 28, 198, 201),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: IconButton(
                        onPressed: () => Get.back(),
                        icon: const Icon(
                          Icons.close,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Image.asset(
                    Assets.png.baam.path,
                    height: size.height * 0.25,
                  ),
                ],
              ),
              ListTile(
                title: const Text(
                  'صفحه اصلی',
                  textAlign: TextAlign.center,
                  style: AppTextStyles.tileTxtStyleW,
                ),
                onTap: () {
                  Get.offAllNamed(RouteName.routeMainScreen);
                },
              ),
              ListTile(
                title: const Text(
                  'شرکت‌های مرکز رشد',
                  textAlign: TextAlign.center,
                  style: AppTextStyles.tileTxtStyleW,
                ),
                onTap: () {
                  // Get.toNamed(RouteName.allCompines);
                  Get.to(AllBusinessListPage() , routeName: RouteName.allCompines);
                  // Get.to(BusinessSearchPage());
                },
              ),
              ListTile(
                title: const Text(
                  'ارتباط با ما',
                  textAlign: TextAlign.center,
                  style: AppTextStyles.tileTxtStyleW,
                ),
                onTap: () {
                  Get.to(const ContactUs());
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: AppDimens.padding, vertical: AppDimens.xlarge),
                child: SvgPicture.asset(
                  Assets.svg.loogo,
                  height: size.height * 0.1,
                  colorFilter: const ColorFilter.mode(
                      // Color.fromARGB(255, 178, 178, 178)
                      Colors.white70,
                      BlendMode.srcIn),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void showCenteredDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return const CustomDrawer();
    },
  );
}
