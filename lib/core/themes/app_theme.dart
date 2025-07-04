import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tidoy_booking_app/core/themes/app_color.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColor.white,
    textTheme: GoogleFonts.manropeTextTheme(),
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColor.white,
    textTheme: GoogleFonts.manropeTextTheme(ThemeData.dark().textTheme),
  );
}
