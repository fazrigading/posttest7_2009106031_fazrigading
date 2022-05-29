import 'package:flutter/material.dart';
// import 'main.dart';
import 'custom_alert.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage(
      {Key? key,
      required this.kreator,
      required this.judul,
      required this.harga,
      required this.gambar,
      required this.kreatorImg})
      : super(key: key);
  final String kreator, judul, gambar, kreatorImg;
  final double harga;

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        toolbarHeight: 70,
      ),
      backgroundColor: const Color.fromRGBO(255, 255, 255, 0.95),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            margin: const EdgeInsets.only(left: 28, right: 28, bottom: 28),
            width: 358,
            height: 358,
            decoration: BoxDecoration(
                boxShadow: const [
                  BoxShadow(
                      blurStyle: BlurStyle.outer,
                      blurRadius: 15,
                      color: Colors.black26)
                ],
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                image: DecorationImage(
                    image: AssetImage(widget.gambar), fit: BoxFit.cover)),
          ),
          Container(
            decoration: const BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      blurStyle: BlurStyle.outer,
                      blurRadius: 12,
                      color: Colors.black26)
                ],
                color: Colors.white70,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50))),
            child: Column(
              children: [
                Container(
                    padding:
                        const EdgeInsets.only(top: 32, left: 28, right: 28),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                              margin: const EdgeInsets.only(right: 16),
                              width: 86,
                              height: 86,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      image: AssetImage(widget.kreatorImg),
                                      fit: BoxFit.cover))),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(widget.kreator,
                                  style: const TextStyle(
                                      color: Color.fromRGBO(132, 132, 132, 1),
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16)),
                              Text(widget.judul,
                                  style: const TextStyle(
                                      color: Color.fromRGBO(18, 18, 18, 1),
                                      fontSize: 24,
                                      fontWeight: FontWeight.w800)),
                              Text('${widget.harga} ETH',
                                  style: const TextStyle(
                                      color: Color.fromRGBO(18, 183, 183, 1),
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold))
                            ],
                          ),
                        ])),
                BeliNFT(harganft: widget.harga)
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class BeliNFT extends StatefulWidget {
  const BeliNFT({Key? key, required this.harganft}) : super(key: key);
  final double harganft;
  @override
  State<BeliNFT> createState() => _BeliNFTState();
}

class _BeliNFTState extends State<BeliNFT> {
  bool confirmPurchase = false;
  double newbalance = 20;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Current Balance $newbalance'),
        Container(
          padding: const EdgeInsets.only(bottom: 32, left: 28, right: 28),
          child: ButtonBar(
            alignment: MainAxisAlignment.center,
            children: [
              Material(
                borderRadius: BorderRadius.circular(18),
                elevation: 5,
                color: const Color.fromRGBO(18, 18, 18, 1),
                child: MaterialButton(
                    onPressed: () {
                      setState(() {
                        customAlert(context, widget.harganft.toString(), 425.3,
                            newbalance, widget.harganft);
                      });
                    },
                    minWidth: 158,
                    height: 58,
                    child: const Text(
                      'Buy Now',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                    )),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
