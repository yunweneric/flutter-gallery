import 'package:flutter/material.dart';
import 'package:flutter_gallery/pages/home.dart';
import 'package:flutter_gallery/utils/colors.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Gallery',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.green),
        useMaterial3: true,
        scaffoldBackgroundColor: AppColors.bg,
        textTheme: TextTheme(
          displayMedium: GoogleFonts.inter(fontSize: 25, fontWeight: FontWeight.w600, color: AppColors.white),
          bodyMedium: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.normal, color: AppColors.white),
          bodySmall: GoogleFonts.inter(fontSize: 10, fontWeight: FontWeight.normal, color: AppColors.white),
        ),
      ),
      home: const HomePage(),
    );
  }
}
