import 'package:flutter/material.dart';

class TeksFormulir extends StatelessWidget {
  const TeksFormulir(
      {Key? key,
      required this.kontroler,
      required this.teks,
      this.sensorinputan = false,
      this.hurufmaksimal})
      : super(key: key);
  final TextEditingController kontroler;
  final String teks;
  final bool sensorinputan;
  final int? hurufmaksimal;

  @override
  Widget build(BuildContext context) {
    return Flexible(
        child: TextFormField(
            controller: kontroler,
            maxLength: hurufmaksimal,
            obscureText: sensorinputan,
            decoration: InputDecoration(
                border: const OutlineInputBorder(), labelText: teks)));
  }
}
