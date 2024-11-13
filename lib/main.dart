import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
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
      title: 'SRBIAU Digital Plaque ',
      locale: const Locale("En"),
      theme: ThemeData(
        dividerColor: Colors.transparent,
        textTheme: GoogleFonts.vazirmatnTextTheme(),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home:   MainScreen(),
    );
  }
}
