import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sherise/controllers/login_controller.dart';

class LoginPage extends StatelessWidget {
  final LoginController _loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'SheRise',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            Text(
              'Login to your account',
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            TextFormField(
              decoration: InputDecoration(
                hintText: 'ex@mail.com',
                labelText: 'Email Address',
              ),
            ),
            SizedBox(height: 10),
            TextFormField(
              obscureText: true,
              decoration: InputDecoration(
                hintText: 'Password',
                labelText: 'Password',
              ),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Checkbox(
                  value: _loginController.rememberMe.value,
                  onChanged: _loginController.toggleRememberMe,
                ),
                Text('Remember Me'),
              ],
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // Call the login function from the controller
                _loginController.login();
              },
              child: Text('Login'),
            ),
            SizedBox(height: 10),
            TextButton(
              onPressed: () {},
              child: Text('Forgot Password?'),
            ),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Don't have an account?"),
                TextButton(
                  onPressed: () {},
                  child: Text('Register'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
