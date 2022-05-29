import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controller.dart';

class ViewProfile extends StatelessWidget {
  const ViewProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserController d = Get.find();
    return Center(
      child: ListView(
        children: [
          Container(
              margin: const EdgeInsets.only(top: 20, bottom: 20),
              width: 200,
              height: 200,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: AssetImage('assets/icon/icon.png'),
                      fit: BoxFit.contain))),
          Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Obx(
                () => Column(
                  children: [
                    Text("${d.firstname.value} ${d.lastname.value}",
                        style: const TextStyle(
                            fontFamily: 'Manrope',
                            color: Colors.black,
                            fontSize: 30,
                            fontWeight: FontWeight.w800)),
                    Text("@${d.username.value}"),
                    Text(d.emailaddress.value),
                    Text(d.chosenGender.value),
                  ],
                ),
              )),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
            child: Column(
              children: [
                Row(
                  children: [
                    Flexible(
                        child: TextFormField(
                            controller: d.formFirst,
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: "First Name",
                                hintText: "ex: Fazri"))),
                    const SizedBox(width: 10),
                    Flexible(
                        child: TextFormField(
                            controller: d.formLast,
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: "Last Name",
                                hintText: "ex: Gading"))),
                  ],
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: d.formEmail,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Email Address",
                      hintText: "ex: fazrigading@gmail.com"),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 28),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text("Gender:"),
                Obx(
                  () => Radio(
                    value: "Male",
                    groupValue: d.chosenGender.value,
                    onChanged: (value) {
                      d.updateGender(value);
                    },
                  ),
                ),
                const Text("Male"),
                Obx(
                  () => Radio(
                    value: "Female",
                    groupValue: d.chosenGender.value,
                    onChanged: (value) {
                      d.updateGender(value);
                    },
                  ),
                ),
                const Text("Female"),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.all(10),
            child: Align(
              alignment: Alignment.center,
              child: Material(
                borderRadius: BorderRadius.circular(18.0),
                elevation: 5,
                color: const Color.fromRGBO(18, 18, 18, 1),
                child: MaterialButton(
                    onPressed: () {
                      d.updateProfile(false);
                      Get.snackbar("Information", "Your Profile has Updated");
                    },
                    minWidth: 150,
                    height: 58,
                    child: const Text(
                      'Submit',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                    )),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
