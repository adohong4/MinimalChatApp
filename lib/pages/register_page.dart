// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:minimal_chat_app/auth/auth_service.dart';
import 'package:minimal_chat_app/components/my_button.dart';
import 'package:minimal_chat_app/components/my_textfield.dart';

class RegisterPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  // tap to go to register page
  void Function()? onTap;
  RegisterPage({super.key, required this.onTap});

  // register method
  void register(BuildContext context) async {
    final _auth = AuthService();

    // password match -> create user
    if (_passwordController.text == _confirmPasswordController.text) {
      try {
        _auth.signUpWithEmailAndPassword(
          _emailController.text,
          _passwordController.text,
        );
      } catch (e) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(title: Text(e.toString())),
        );
      }
    }
    // passwords dont match -> tell user to fix
    else {
      showDialog(
        context: context,
        builder:
            (context) =>
                const AlertDialog(title: Text("Passwords don't match")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //logo
            Icon(
              Icons.message,
              size: 100,
              color: Theme.of(context).colorScheme.primary,
            ),
            const SizedBox(height: 50),

            // welcome back message
            Text(
              "Let's create an account!",
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 25),

            // email textfield
            MyTextfield(
              hintText: 'Email',
              obscureText: false,
              controller: _emailController,
            ),
            const SizedBox(height: 10),
            // pw textfield
            MyTextfield(
              hintText: 'Password',
              obscureText: true,
              controller: _passwordController,
            ),
            const SizedBox(height: 10),
            // confirm pw textfield
            MyTextfield(
              hintText: 'Confirm password',
              obscureText: true,
              controller: _confirmPasswordController,
            ),

            const SizedBox(height: 25),
            // login button
            MyButton(text: "Register", onTap: () => register(context)),
            const SizedBox(height: 25),
            // register button
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already have an account? ",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                GestureDetector(
                  onTap: onTap,
                  child: Text(
                    "Login now",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
