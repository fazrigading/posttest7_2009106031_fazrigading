import 'package:flutter/material.dart';

Future<dynamic> customAlert(BuildContext context, String text, double balance,
    double newbalance, double harganft) {
  return showDialog(
    barrierDismissible: false,
    context: context,
    builder: (context) {
      return AlertDialog(
        backgroundColor: Colors.white,
        actions: [
          Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Are you sure to purchase this NFT for $text ETH?",
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    OutlinedButton(
                      onPressed: () {
                        newbalance = balance - harganft;
                        Navigator.pop(context);
                      },
                      style: OutlinedButton.styleFrom(
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8))),
                          primary: Colors.white,
                          backgroundColor:
                              const Color.fromRGBO(13, 183, 183, 1),
                          textStyle: const TextStyle(
                              fontFamily: 'Manrope',
                              fontSize: 16,
                              fontWeight: FontWeight.w600)),
                      child: const Text("Confirm"),
                    ),
                    const SizedBox(width: 10),
                    OutlinedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: OutlinedButton.styleFrom(
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8))),
                          primary: const Color.fromRGBO(13, 183, 183, 1),
                          backgroundColor: Colors.white,
                          textStyle: const TextStyle(
                              fontFamily: 'Manrope',
                              fontSize: 16,
                              fontWeight: FontWeight.w600)),
                      child: const Text("Cancel"),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      );
    },
  );
}
