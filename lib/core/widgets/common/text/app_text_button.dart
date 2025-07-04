import 'package:flutter/material.dart';
import 'package:tidoy_booking_app/core/themes/app_color.dart';

class AppTextButton extends StatelessWidget {
  final String label;
  final Color color;
  final FontWeight weight;
  final double fontSize;
  final bool textCenter;

  const AppTextButton({
    super.key,
    required this.label,
    this.color = AppColor.white,
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
