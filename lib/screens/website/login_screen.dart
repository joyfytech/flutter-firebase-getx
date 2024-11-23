import 'package:demo_flutter/controller/website/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final LoginController loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 600),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              controller: loginController.emailController,
              decoration: const InputDecoration(
                  labelText: "Email",
                  hintText: "Enter Email",
                  border: OutlineInputBorder()),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: loginController.passwordControlller,
              decoration: const InputDecoration(
                  labelText: "Password",
                  hintText: "Enter Password",
                  border: OutlineInputBorder()),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () {
                  loginController.loginSubmit(context);
                },
                child: const Text("Login"))
          ],
        ),
      ),
    );
  }
}
