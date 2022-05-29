import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UnknownRoutePage extends StatelessWidget {
  const UnknownRoutePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      children: [
        const Text("Oops 404 not found"),
        ElevatedButton(
            onPressed: () {
              Get.offAllNamed('/homepage');
            },
            child: const Text("To Homepage"))
      ],
    ));
  }
}
