import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sherise/constants/app_color.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 6), () {
      Get.offNamed('/login'); // Navigate to login page after 6 seconds
    });
    return Scaffold(
      backgroundColor: AppColors.lightBlue, // Background color
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Circular logo
            Container(
              width: MediaQuery.of(context).size.width * 0.4,
              height: MediaQuery.of(context).size.width * 0.4,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.lightBlue,
                // For example: Image.asset('assets/logo.png'),
              ),
              child: Image.asset('assets/images/splash_pic_png.png'),
            ),
            const SizedBox(height: 40),
            // App name
            const Text(
              'SheRise',
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
                fontFamily: "CormorantGaramond",
              ),
            ),
            const SizedBox(height: 40),
            // App slogan
            const Text(
              'Empowering Women,\n   Elevating Careers',
              style: TextStyle(
                fontSize: 24,
                color: Colors.black54,
                fontFamily: "PlayFairDisplay",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
