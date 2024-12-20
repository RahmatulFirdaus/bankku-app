import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:id_camp_final_project/splash_screen/opening.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Banking App",
      theme: ThemeData(textTheme: GoogleFonts.poppinsTextTheme()),
      home: const Openingpage(),
    );
  }
}
