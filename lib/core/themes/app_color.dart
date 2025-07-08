import 'package:flutter/material.dart';

abstract class AppColor {
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Colors.black;
  static const Color primary = Color(0xFFFF9A01);
}

class LightColor extends AppColor {
  static const Color text100 = Color(0xFF2D2E2E);
  static const Color text80 = Color(0xFF747677);
  static const Color text60 = Color(0xFFA6A9AC);
  static const Color text10 = Color(0xFFFFFFFF);
  static const Color bg100 = Color(0xFF2D2E2E);
  static const Color bg20 = Color(0xFFEDF1F5);
  static const Color bg30 = Color(0xFFE4E9ED);
}

class DarkColor extends AppColor {
  static const Color text100 = Color(0xFF2D2E2E);
  static const Color text80 = Color(0xFF747677);
  static const Color text60 = Color(0xFFA6A9AC);
  static const Color text10 = Color(0xFFFFFFFF);
  static const Color bg100 = Color(0xFF2D2E2E);
  static const Color bg20 = Color(0xFFEDF1F5);
  static const Color bg30 = Color(0xFFE4E9ED);
}
