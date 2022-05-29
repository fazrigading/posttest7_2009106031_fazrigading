import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'form.dart';
import 'controller.dart';

final UserController c = Get.put(UserController());

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/icon/icon.png',
              height: 200,
              width: 200,
            ),
            const SizedBox(height: 30),
            TeksFormulir(
                kontroler: c.formUsername,
                teks: "Username",
                sensorinputan: false),
            const SizedBox(height: 15),
            TeksFormulir(
                kontroler: c.formPassword,
                teks: "Password",
                sensorinputan: true),
            const SizedBox(height: 15),
            SizedBox(
              child: Align(
                alignment: Alignment.center,
                child: Material(
                  borderRadius: BorderRadius.circular(10.0),
                  elevation: 5,
                  color: const Color.fromRGBO(18, 18, 18, 1),
                  child: MaterialButton(
                      onPressed: () {
                        if (c.formUsername.text == "admin") {
                          if (c.formPassword.text == "nftmarketplace") {
                            Get.offNamed('/adminpage');
                          } else {
                            Get.snackbar(
                              "Login Failed: Incorrect Credentials",
                              "Wrong username and/or password. Please try again.",
                            );
                          }
                        } else if (c.username.value == c.formUsername.text &&
                            c.password.value == c.formPassword.text) {
                          Get.offNamed('/homepage');
                        } else {
                          Get.snackbar(
                            "Login Failed: User Not Found",
                            "You are not registered yet, try to register first and try again.",
                          );
                        }
                      },
                      minWidth: double.infinity,
                      height: 50,
                      child: const Text(
                        'Log In',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w700),
                      )),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Haven't registered yet?"),
                const SizedBox(width: 10),
                TextButton(
                    onPressed: () {
                      Get.toNamed('/registpage');
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          const Color.fromRGBO(18, 183, 183, 1)),
                    ),
                    child: const Text(
                      "Register Now",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w700),
                    ))
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class RegistPage extends StatelessWidget {
  const RegistPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
        child: ListView(
          children: [
            const SizedBox(height: 80),
            Image.asset(
              'assets/icon/icon.png',
              height: 200,
              width: 200,
            ),
            const SizedBox(height: 15),
            Row(
              children: [
                TeksFormulir(kontroler: c.formFirst, teks: "First Name"),
                const SizedBox(width: 15),
                TeksFormulir(kontroler: c.formLast, teks: "Last Name"),
              ],
            ),
            const SizedBox(height: 15),
            TeksFormulir(kontroler: c.formUsername, teks: "Username"),
            const SizedBox(height: 15),
            TeksFormulir(
                kontroler: c.formPassword,
                teks: "Password",
                sensorinputan: true),
            const SizedBox(height: 15),
            TeksFormulir(kontroler: c.formEmail, teks: "Email Address"),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text("Gender:"),
                Obx(
                  () => Radio(
                    value: "Male",
                    groupValue: c.chosenGender.value,
                    onChanged: (value) {
                      c.updateGender(value);
                    },
                  ),
                ),
                const Text("Male"),
                Obx(
                  () => Radio(
                    value: "Female",
                    groupValue: c.chosenGender.value,
                    onChanged: (value) {
                      c.updateGender(value);
                    },
                  ),
                ),
                const Text("Female"),
              ],
            ),
            SizedBox(
              child: Align(
                alignment: Alignment.center,
                child: Material(
                  borderRadius: BorderRadius.circular(10.0),
                  elevation: 5,
                  color: const Color.fromRGBO(18, 18, 18, 1),
                  child: MaterialButton(
                      onPressed: () {
                        c.updateProfile(1);
                        Get.snackbar("Registration Success",
                            "You will be redirected in 2 seconds...");
                        Timer(const Duration(seconds: 2), () {
                          Get.offNamed('/loginpage');
                        });
                      },
                      minWidth: double.infinity,
                      height: 50,
                      child: const Text(
                        'Register',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w700),
                      )),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
