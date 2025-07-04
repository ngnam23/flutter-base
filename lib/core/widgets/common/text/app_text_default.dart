import 'package:flutter/material.dart';
import 'package:tidoy_booking_app/core/themes/app_color.dart';

class AppTextDefault extends StatelessWidget {
  final String label;
  final Color color;
  final FontWeight weight;
  final double fontSize;
  final bool textCenter;

  const AppTextDefault({
    super.key,
    required this.label,
    this.color = LightColor.text100,
    this.weight = FontWeight.w700,
    this.fontSize = 14,
    this.textCenter = false,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: TextStyle(color: color, fontSize: fontSize, fontWeight: weight),
      textAlign: textCenter ? TextAlign.center : TextAlign.left,
    );
  }
}
