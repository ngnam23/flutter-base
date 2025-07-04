import 'package:flutter/material.dart';
import 'package:tidoy_booking_app/core/themes/app_color.dart';
import 'package:tidoy_booking_app/core/widgets/common/text/app_text_button.dart';

class ButtonPrimary extends StatelessWidget {
  final double? width;
  final VoidCallback? onPressed;
  final String label;

  const ButtonPrimary({
    super.key,
    this.width,
    required this.label,
    this.onPressed,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0),

      child: SizedBox(
        width: width ?? double.infinity,
        height: 52,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColor.primary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          onPressed: onPressed,
          child: AppTextButton(label: label),
        ),
      ),
    );
  }
}
