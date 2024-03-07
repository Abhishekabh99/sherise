import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sherise/controllers/login_controller.dart';
import 'package:sherise/constants/app_color.dart';

class LoginPage extends StatelessWidget {
  final LoginController _loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightBlue,
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'SheRise',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: AppColors.navyBlue,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              Text(
                'Login to your account',
                style: TextStyle(
                  fontSize: 18,
                  color: AppColors.navyBlue,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'ex@mail.com',
                  labelText: 'Email Address',
                  labelStyle: TextStyle(
                    color: AppColors.navyBlue,
                  ),
                ),
                onChanged: _loginController.setEmail,
              ),
              SizedBox(height: 10),
              TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Password',
                  labelText: 'Password',
                  labelStyle: TextStyle(
                    color: AppColors.navyBlue,
                  ),
                ),
                onChanged: _loginController.setPassword,
              ),
              SizedBox(height: 10),
              Obx(() => Row(
                    children: [
                      Checkbox(
                        value: _loginController.rememberMe.value,
                        onChanged: _loginController.toggleRememberMe,
                      ),
                      Text(
                        'Remember Me',
                        style: TextStyle(
                          color: AppColors.navyBlue,
                        ),
                      ),
                    ],
                  )),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  _loginController.login();
                },
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(AppColors.callToActionColor),
                ),
                child: Text('Login'),
              ),
              SizedBox(height: 10),
              TextButton(
                onPressed: () {},
                child: Text(
                  'Forgot Password?',
                  style: TextStyle(
                    color: AppColors.navyBlue,
                  ),
                ),
              ),
              Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account?",
                    style: TextStyle(
                      color: AppColors.navyBlue,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'Register',
                      style: TextStyle(
                        color: AppColors.navyBlue,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
