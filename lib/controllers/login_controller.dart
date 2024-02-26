import 'package:get/get.dart';

class LoginController extends GetxController {
  final email = ''.obs;
  final password = ''.obs;
  final rememberMe = false.obs; // Added rememberMe state

  void setEmail(String value) => email.value = value;
  void setPassword(String value) => password.value = value;
  void toggleRememberMe(bool? value) {
    rememberMe.value = value ?? false;
  }

  void login() {
    // Perform authentication logic here
    // For demonstration purposes, we'll simply print the email, password, and rememberMe state
    print(
        'Email: ${email.value}, Password: ${password.value}, Remember Me: ${rememberMe.value}');

    // Redirect to the dummy page after successful login
    Get.offNamed('/city_selection');
  }
}
