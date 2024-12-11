import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:srbiau_digital_plaque/component/dimens.dart';
import 'package:srbiau_digital_plaque/component/extentions.dart';
import 'package:srbiau_digital_plaque/component/res/app_colors.dart';
import 'package:srbiau_digital_plaque/gen/assets.gen.dart';
import 'package:srbiau_digital_plaque/main.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3)).then((onValue) {
      Get.offAndToNamed(RouteName.routeMainScreen);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.primaryPelak,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                Assets.svg.baam,
                height: size.height * 0.25,
                colorFilter: const ColorFilter.mode(
                    AppColors.neutralLight, BlendMode.srcIn),
              ),
              AppDimens.xlarge.height,
              const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: SpinKitFoldingCube(
                      color: Colors.white,
                      size: 34,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
