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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  onPressed: () {},
                  child: Text("Cheese", style: TextStyle(color: yaziRenk1)),
                  style: TextButton.styleFrom(backgroundColor: anaRenk),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text("Susage", style: TextStyle(color: yaziRenk1)),
                  style: TextButton.styleFrom(backgroundColor: anaRenk),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text("Olive", style: TextStyle(color: yaziRenk1)),
                  style: TextButton.styleFrom(backgroundColor: anaRenk),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text("Pepper", style: TextStyle(color: yaziRenk1)),
                  style: TextButton.styleFrom(backgroundColor: anaRenk),
                ),
              ],
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
