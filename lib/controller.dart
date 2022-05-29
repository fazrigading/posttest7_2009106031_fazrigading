import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  var firstname = "".obs;
  var lastname = "".obs;
  var emailaddress = "".obs;
  var username = "".obs;
  var password = "".obs;
  var chosenGender = "".obs;
  void updateGender(var gender) {
    chosenGender.value = gender;
  }

  final formFirst = TextEditingController();
  final formLast = TextEditingController();
  final formEmail = TextEditingController();
  final formUsername = TextEditingController();
  final formPassword = TextEditingController();
  final a1 = TextEditingController();
  final a2 = TextEditingController();

  void updateProfile(cred) {
    firstname.value = formFirst.text;
    lastname.value = formLast.text;
    emailaddress.value = formEmail.text;
    if (cred == 1) {
      username.value = formUsername.text;
      password.value = formPassword.text;
    }
  }
}
