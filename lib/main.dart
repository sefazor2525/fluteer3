import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(bugunneyesek());
}

class bugunneyesek extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text(
            "Bugün Ne Yesek ?",
            style: TextStyle(fontSize: 36, color: Colors.blue),
          ),
        ),
        body: yemeksayfasi(),
      ),
    );
  }
}

class yemeksayfasi extends StatefulWidget {
  @override
  State<yemeksayfasi> createState() => _yemeksayfasiState();
}

class _yemeksayfasiState extends State<yemeksayfasi> {
  int corbano = 1;

  int anayemekno = 1;

  int tatlino = 1;
  List<String> corbaAdlari = [
    "mercimek",
    "tarhana",
    "tavuk suyu",
    "düğün çorbası",
    "yoğurtlu çorba",
  ];
  List<String> anayemekadlari = [
    "patlıcan",
    "mantı",
    "kuru fasülye",
    "içli köfte",
    "balık",
  ];
  List<String> tatliAdlari = [
    "kadayıf",
    "baklava",
    "sütlaç",
    "kazandibi",
    "dondurma",
  ];

  void YemekDegistir() {
    setState(() {
      corbano = Random().nextInt(5) + 1;
      anayemekno = Random().nextInt(5) + 1;
      tatlino = Random().nextInt(5) + 1;
    });
    print("Yemekler Random Değiştirildi");
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Expanded(
            child: TextButton(
              onPressed: () {
                YemekDegistir();
              },
              child: Image.asset("assets/corba_$corbano.jpg"),
            ),
          ),
          Text(corbaAdlari[corbano - 1], style: TextStyle(fontSize: 15)),
          Divider(height: 10, color: Colors.red),
          Expanded(
            child: TextButton(
              onPressed: () {
                YemekDegistir();
              },
              child: Image.asset("assets/yemek_$anayemekno.jpg"),
            ),
          ),
          Text(anayemekadlari[anayemekno - 1], style: TextStyle(fontSize: 15)),
          Divider(height: 10, color: Colors.red),
          Expanded(
            child: TextButton(
              onPressed: () {
                YemekDegistir();
              },
              child: Image.asset("assets/tatli_$tatlino.jpg"),
            ),
          ),
          Text(tatliAdlari[tatlino - 1], style: TextStyle(fontSize: 15)),
          Divider(height: 10, color: Colors.red),
        ],
      ),
    );
  }
}
