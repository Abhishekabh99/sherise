import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final email = ''.obs;
  final password = ''.obs;
  final rememberMe = false.obs; // Added rememberMe state

  // Valid user credentials
  final validUser =
      FakeUser(emailAddress: 'example@mail.com', password: '1234');

  void setEmail(String value) => email.value = value;
  void setPassword(String value) => password.value = value;

  void toggleRememberMe(bool? value) {
    rememberMe.value = value ?? false;
    update(); // Update the UI when rememberMe value changes
  }

  void login() {
    // Trim the entered email address to remove any leading or trailing whitespace
    final trimmedEmail = email.value.trim();

    // Check if the trimmed email and password match the valid user
    if (trimmedEmail == validUser.emailAddress &&
        password.value == validUser.password) {
      // Redirect to the dummy page after successful login
      Get.offNamed('/city_selection');
    } else {
      // Show a message if the email or password is incorrect
      Get.snackbar(
        'Error',
        'Invalid email or password',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }
}

// fake_user.dart

class FakeUser {
  final String emailAddress;
  final String password;

  FakeUser({required this.emailAddress, required this.password});
}
