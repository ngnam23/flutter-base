import 'package:flutter/material.dart';
import 'package:tidoy_booking_app/core/themes/app_color.dart';

class AppTextSmall extends StatelessWidget {
  final String label;
  final Color color;
  final FontWeight weight;
  final double fontSize;
  final bool textCenter;

  const AppTextSmall({
    super.key,
    required this.label,
    this.color = LightColor.text80,
    this.weight = FontWeight.w400,
    this.fontSize = 12,
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
