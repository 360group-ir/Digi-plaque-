import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:srbiau_digital_plaque/view/company_list.dart';
import 'package:srbiau_digital_plaque/view/contact_us.dart';
import 'package:srbiau_digital_plaque/view/eplak.dart';
import 'package:srbiau_digital_plaque/view/mainscreen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    Center(
      child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 430),
          child: const MyApp()),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'e-pelak',
      locale: const Locale("En"),
      theme: ThemeData(
        dividerColor: Colors.transparent,
        textTheme: GoogleFonts.vazirmatnTextTheme(),
        useMaterial3: true,
      ),
      getPages: [
        GetPage(
          name: RouteName.routeMainScreen,
          page: () => MainScreen(),
        ),
        GetPage(
          name: RouteName.routeCompaneyList,
          page: () => const CompanyList(
            mainColor: Color.fromARGB(255, 63, 105, 225),
          ),
        ),
        GetPage(
          name: RouteName.routeEpelak,
          page: () => Eplak(mainColor:  const Color.fromARGB(255, 63, 105, 225), visiblity: true),
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
  static String routeEpelak = "/e-pelak";
  static String contactUs = "/ContactUs";
}
