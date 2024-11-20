import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:srbiau_digital_plaque/component/dimens.dart';
import 'package:srbiau_digital_plaque/component/extentions.dart';
import 'package:srbiau_digital_plaque/component/res/text_styles.dart';
import 'package:srbiau_digital_plaque/gen/assets.gen.dart';
import 'package:srbiau_digital_plaque/main.dart';
import 'package:srbiau_digital_plaque/view/mainscreen.dart';


class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Animate(
      effects: const[  ScaleEffect(duration: Duration(milliseconds: 500) ,) , FadeEffect(duration: Duration(milliseconds: 500))],
      child: Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        backgroundColor: Colors.transparent,
        child: Container(
          width: size.width ,
          height: size.height, 
          decoration: BoxDecoration(
            color: const  Color.fromARGB(255, 28, 198, 201),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
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
                  SvgPicture.asset(
                    Assets.svg.dlogo,
                    height: size.height * 0.265,
                    colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                  ),
                ],
              ),
              (size.height * 0.075).height,
              ListTile(
                title: const Text(
                  'صفحه اصلی',
                  textAlign: TextAlign.center,
                  style: AppTextStyles.tileTxtStyleW,
                ),
                onTap: () {
                  Get.offAll(MainScreen());
                },
              ),
              (size.height * 0.045).height,
              ListTile(
                title: const Text(
                  'شرکت‌های مرکز رشد',
                  textAlign: TextAlign.center,
                  style: AppTextStyles.tileTxtStyleW,
                ),
                onTap: () {
                  Get.offAll(MainScreen());
                },
              ),
              (size.height * 0.045).height,
              ListTile(
                title: const Text(
                  'ارتباط با ما',
                  textAlign: TextAlign.center,
                  style: AppTextStyles.tileTxtStyleW,
                ),
                onTap: () {
                  Get.toNamed(RouteName.contactUs);
                },
              ),
              const Expanded(child: SizedBox()),
              (size.height * 0.045).height,
              Padding(
                padding: const EdgeInsets.only(bottom: AppDimens.xlarge ),
                child: SvgPicture.asset(
                  Assets.svg.groper360,
                  height: size.height * 0.034,
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







// class CustomDrawer extends StatelessWidget {
//   const CustomDrawer({super.key});

//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return SafeArea(
//       child: Scaffold(
//         appBar: PreferredSize(
//           preferredSize: Size(size.width, size.height * 0.12),
//           child: Container(
//             height: size.height * 0.12,
//             color: const Color.fromARGB(255, 63, 105, 225), 
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//                 Align(
//                 alignment: Alignment.centerLeft,
//                 child: Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: IconButton(
//                       onPressed: () => Get.back(),
//                       icon: const Icon(
//                         CupertinoIcons.xmark,
//                         color: Colors.white,
//                         weight: 18,
//                       )),
//                 ),
//               ),
//               ],
//             ),
//           )),
//         body:  Container(
//           color:
//               const Color.fromARGB(255, 63, 105, 225), 
//           height: size.height, 
//           width: size.width, 
//           child: Column(
//             children: [
//               // (size.height * 0.03).height,
//               SvgPicture.asset(
//                 Assets.svg.dlogo,
//                 height: size.height * 0.265,
//                 colorFilter:
//                     const ColorFilter.mode(Colors.white, BlendMode.srcIn),
//               ),
//               (size.height*0.075).height,
//               ListTile(
//                 title: const Text(
//                   'صفحه اصلی',
//                   textAlign: TextAlign.center,
//                   style: AppTextStyles.titleStyleW
//                 ),
//                 onTap: () {
//                   Get.offAll(MainScreen());
//                 },
//               ),
//               (size.height*0.045).height,
//               ListTile(
//                 title: const Text(
//                   'شرکت‌های مرکز رشد',
//                   textAlign: TextAlign.center,
//                   style: AppTextStyles.titleStyleW
//                 ),
//                 onTap: () {
//                   Get.offAll(MainScreen());
//                 },
//               ),
//               (size.height*0.045).height,
//               ListTile(
//                 title: const Text(
//                   'ارتباط با ما',
//                   textAlign: TextAlign.center,
//                   style: AppTextStyles.titleStyleW
//                 ),
//                 onTap: () {
//                   Get.to(const ContactUs());
//                 },
//               ),
//               const Expanded(child: SizedBox()),
//                Padding(
//                 padding: const EdgeInsets.only(bottom:  (AppDimens.xlarge*2)),
//                 child: SvgPicture.asset(Assets.svg.groper360 , height: size.height*0.034,)
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// void showFullScreenDrawer(BuildContext context) {
//   showModalBottomSheet(
//     context: context,
//     sheetAnimationStyle: AnimationStyle(duration: const Duration(milliseconds: 800),reverseDuration: const Duration(milliseconds: 800)),
//     isScrollControlled: true,
//     builder: (BuildContext context) {
//       return const CustomDrawer();
//     },
//     backgroundColor: Colors.transparent,
//   );
// }
