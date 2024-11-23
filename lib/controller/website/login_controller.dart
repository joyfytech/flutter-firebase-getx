import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo_flutter/model/website/user_model.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../router/project_router.dart';

class LoginController extends GetxController {
  final emailController = TextEditingController();
  final passwordControlller = TextEditingController();

  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  loginSubmit(BuildContext context) async {
    if (await validateFields(context)) {


      var docRef = firebaseFirestore.collection("Users").doc();

      print(
          "User Data\nUserId : ${docRef.id}\nEmail : ${emailController.text.toString()}\nPassword : ${passwordControlller.text.toString()}");




      var user = UserModel(
          userId: docRef.id,
          userEmail: emailController.text.toString(),
          userPassword: passwordControlller.text.toString());


      docRef.set(user.toMap());

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content:
              Text('${emailController.text.toString()} login successfully'),
          duration: const Duration(seconds: 2),
        ),
      );

      /*


        add - set
        update - update
        delete - delete
        get = get



         */

      clearController();

      Get.toNamed(ProjectRouter.HOME_SCREEN);
    }
  }

  bool validateFields(BuildContext context) {
    // Email validation regex pattern
    final emailRegex = RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.com$");

    // Validate email is not empty
    if (emailController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter email'),
          duration: Duration(seconds: 2),
        ),
      );
      return false;
    }

    // Validate email format using regex
    if (!emailRegex.hasMatch(emailController.text)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Invalid email format'),
          duration: Duration(seconds: 2),
        ),
      );
      return false;
    }

    // Validate password is not empty
    if (passwordControlller.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter password'),
          duration: Duration(seconds: 2),
        ),
      );
      return false;
    }

    // Validate password length is at least 6 characters
    if (passwordControlller.text.length < 6) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Password must be at least 6 characters long'),
          duration: Duration(seconds: 2),
        ),
      );
      return false;
    }

    // If all validations pass, return true
    return true;
  }

  void clearController() {
    emailController.clear();
    passwordControlller.clear();
  }
}
