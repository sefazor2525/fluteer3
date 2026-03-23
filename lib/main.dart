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
          backgroundColor: Colors.lightGreenAccent,
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

class yemeksayfasi extends StatelessWidget {
  int corbano = 1;
  int anayemekno = 1;
  int tatlino = 1;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Expanded(
            child: TextButton(
              onPressed: () {
                print("çorbaya tıklandı");
              },
              child: Image.asset("assets/corba_$corbano.jpg"),
            ),
          ),
          Expanded(
            child: TextButton(
              onPressed: () {
                print("ana yemeğe tıklandı");
              },
              child: Image.asset("assets/yemek_$anayemekno.jpg"),
            ),
          ),
          Expanded(
            child: TextButton(
              onPressed: () {
                print("tatlıya tıklandı");
              },
              child: Image.asset("assets/tatli_$tatlino.jpg"),
            ),
          ),
        ],
      ),
    );
  }
}
