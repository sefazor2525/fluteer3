import 'package:flutter/material.dart';
import 'package:tasarim_calismasi/renkler.dart';

class Anasayfa extends StatefulWidget {
  const Anasayfa({super.key});

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Pizza Delux",
          style: TextStyle(
            color: yaziRenk1,
            fontSize: 45,
            fontFamily: "Pacifico",
          ),
        ),
        backgroundColor: anaRenk,
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 16),
            child: Text(
              "Beef Cheese",
              style: TextStyle(
                fontSize: 36,
                color: anaRenk,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16),
            child: Image.asset("resimler/pizza.jpg"),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 36),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const SizedBox(width: 16),
                  Chip(icerik: "Margherita"),
                  const SizedBox(width: 12),
                  Chip(icerik: "Pepperoni Pizza"),
                  const SizedBox(width: 12),
                  Chip(icerik: "Dört Peynirli"),
                  const SizedBox(width: 12),
                  Chip(icerik: "Dört Peynirli"),
                  const SizedBox(width: 12),
                  Chip(icerik: "Barbekü (BBQ) Tavuklu Pizza"),
                  const SizedBox(width: 12),
                  Chip(icerik: "Vejetaryen"),
                  const SizedBox(width: 12),
                  Chip(icerik: "Hawaii Pizzası"),
                  const SizedBox(width: 12),
                  Chip(icerik: "Kapalı Pizza"),
                  const SizedBox(width: 16),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Text(
                  "20 min",
                  style: TextStyle(
                    fontSize: 22,
                    color: yaziRenk2,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    "Delivery",
                    style: TextStyle(
                      fontSize: 26,
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  "Meat lover , getready to meet your pizza ! ",
                  style: TextStyle(fontSize: 22, color: yaziRenk2),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "\$ 5.98",
                style: TextStyle(
                  color: anaRenk,
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                width: 200,
                height: 50,
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    "ADD TO CART",
                    style: TextStyle(
                      color: yaziRenk1,
                      fontSize: 25,
                      backgroundColor: anaRenk,
                    ),
                  ),
                  style: TextButton.styleFrom(
                    backgroundColor: anaRenk,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadiusGeometry.all(
                        Radius.circular(10),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class Chip extends StatelessWidget {
  final String icerik;
  Chip({required this.icerik});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      child: Text(icerik, style: TextStyle(color: yaziRenk1)),
      style: TextButton.styleFrom(backgroundColor: anaRenk),
    );
  }
}
