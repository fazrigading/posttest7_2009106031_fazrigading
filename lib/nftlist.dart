import 'package:flutter/material.dart';
import 'items.dart';

class FeaturedNFT extends StatelessWidget {
  const FeaturedNFT({Key? key}) : super(key: key);

  final List<Widget> _nftarts = const [
    Item(
      kreator: 'Pop Wonder Edition',
      judul: 'Gutter Rat #1780',
      harga: 0.525,
      gambar: 'assets/gutterrat1780.png',
      kreatorImg: 'assets/popwonderedition.png',
    ),
    Item(
      kreator: 'Team Azuki',
      judul: 'Azuki #6905',
      harga: 21.26,
      gambar: 'assets/azuki6905.png',
      kreatorImg: 'assets/azuki.jpg',
    ),
    Item(
      kreator: 'Team Azuki',
      judul: 'Azuki #6184',
      harga: 21.26,
      gambar: 'assets/azuki6184.png',
      kreatorImg: 'assets/azuki.jpg',
    ),
    Item(
      kreator: 'Pudgy Penguins',
      judul: 'Penguin #1528',
      harga: 1.792,
      gambar: 'assets/pudgypenguin1528.png',
      kreatorImg: 'assets/pudgypenguins.png',
    ),
    Item(
      kreator: 'Bored Ape Kennel Club',
      judul: 'Dog #9988',
      harga: 7.2,
      gambar: 'assets/boredapekennelclub9988.png',
      kreatorImg: 'assets/bakc.png',
    ),
    Item(
      kreator: 'Bored Ape Yacht Club',
      judul: 'Bored Ape #8854',
      harga: 20,
      gambar: 'assets/boredape8854.png',
      kreatorImg: 'assets/bayc.png',
    ),
    Item(
      kreator: 'MekaVerse',
      judul: 'Meka #8491',
      harga: 0.2835,
      gambar: 'assets/meka8491.png',
      kreatorImg: 'assets/mekaverse.png',
    ),
    Item(
      kreator: 'Zeff Hood',
      judul: 'Dacing David',
      harga: 7,
      gambar: 'assets/dacingdavid.png',
      kreatorImg: 'assets/zeffhood.png',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: _nftarts.toList(),
        ));
  }
}
