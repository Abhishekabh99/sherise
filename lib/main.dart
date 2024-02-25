import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'ui/pages/login_page.dart';
import 'ui/pages/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SheRise',
      theme: ThemeData(
          // Define your app theme here
          ),
      initialRoute: '/splash', // Set initial route to splash screen
      getPages: [
        GetPage(name: '/splash', page: () => SplashScreen()),
        GetPage(name: '/login', page: () => LoginPage()),
        // Define other routes here
      ],
    );
  }
}
