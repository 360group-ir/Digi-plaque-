import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:srbiau_digital_plaque/component/api_constant.dart';
import 'package:srbiau_digital_plaque/component/res/app_colors.dart';
import 'package:srbiau_digital_plaque/component/responsive.dart';
import 'package:srbiau_digital_plaque/view/company_list.dart';
import 'package:srbiau_digital_plaque/view/contact_us.dart';
import 'package:srbiau_digital_plaque/view/eplak.dart';
import 'package:srbiau_digital_plaque/view/mainscreen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
   SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor:AppColors.primaryPelak,
      systemNavigationBarColor:AppColors.primaryPelak));
  runApp(
    LayoutBuilder(
      builder: (context, constraints) {
        return Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(
                maxWidth: Responsive.isDesktop(context)
                    // ? 1080
                    ?constraints.maxWidth
                    : Responsive.isTablet(context)
                        ? constraints.maxWidth
                        : Responsive.isMobile(context)
                            ? constraints.maxWidth
                            : 435),
            child: const MyApp(),
          ),
        );
      },
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'e-pelak',
      locale: const Locale("En"),
      theme: ThemeData(
        dividerColor: Colors.transparent,
        textTheme: GoogleFonts.vazirmatnTextTheme(),
        useMaterial3: true,
        colorSchemeSeed: AppColors.primaryPelak
      ),
      defaultTransition: Transition.cupertinoDialog,
      transitionDuration: Durations.extralong4,
      getPages: [
        GetPage(
          name: RouteName.routeMainScreen,
          page: () => MainScreen(),
        ),
        GetPage(
          name: RouteName.routeCompaneyList,
          page: () =>  CompanyList(
            mainColor: AppColors.primaryPelak,
          ),
        ),
        GetPage(
          name: RouteName.routeEpelak,
          page: () => Eplak(mainColor: const Color.fromARGB(255, 28, 198, 201), visiblity: true),
        ),
        GetPage(
          name: RouteName.contactUs,
          page: () => const ContactUs(),
        ),
      ],
      debugShowCheckedModeBanner: false,
      
      home: MainScreen(),
    );
  }
}

class RouteName {
  RouteName._();

  static String routeMainScreen = "/SRB-IAU";
  static String routeCompaneyList = "/BlockList";
  static String routeEpelak = "/e-pelak/${ApiConstant.code}";
  static String contactUs = "/ContactUs";
}
