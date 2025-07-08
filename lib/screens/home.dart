import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tidoy_booking_app/core/widgets/common/button/button_primary.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: ButtonPrimary(
            label: 'Reset',
            onPressed: () async {
              final prefs = await SharedPreferences.getInstance();
              await prefs.setBool('onboardingSeen', false);
            },
          ),
        ),
      ),
    );
  }
}
