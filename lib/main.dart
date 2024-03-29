import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sherise/controllers/home_controller.dart';
import 'package:sherise/ui/pages/city_selection_page.dart';
import 'package:sherise/ui/pages/home_page.dart';
import 'package:sherise/ui/pages/login_page.dart';
import 'package:sherise/ui/pages/splash_screen.dart'; // Import the splash screen page

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
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/splash', // Set initial route to the splash screen
      getPages: [
        GetPage(
            name: '/splash',
            page: () => SplashScreen()), // Define the splash screen route
        GetPage(name: '/login', page: () => LoginPage()),
        GetPage(name: '/city_selection', page: () => CitySelectionPage()),
        GetPage(
          name: '/HomePage',
          page: () => HomePage(),
          binding: BindingsBuilder(() {
            Get.lazyPut(() => HomeController());
          }),
        ),
      ],
    );
  }
}
