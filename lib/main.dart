import 'dart:math';

import 'package:flutter/material.dart';

void main() {
<<<<<<< HEAD
  runApp(BugunNeYesek());
}

class BugunNeYesek extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color(0xFFFFFBF7),
        appBar: AppBar(
          backgroundColor: Color(0xFFFFFBF7),
          elevation: 0,
          centerTitle: true,
          title: Text(
            "Lezzet Durağı",
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Color(0xFFFF5722),
            ),
          ),
        ),

        body: SingleChildScrollView(child: YemekSayfasi()),
=======
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
>>>>>>> 5bfdf3edede70da7a4b1828c1c77c4b84a79721e
      ),
    );
  }
}

<<<<<<< HEAD
class YemekSayfasi extends StatefulWidget {
  @override
  State<YemekSayfasi> createState() => _YemekSayfasiState();
}

class _YemekSayfasiState extends State<YemekSayfasi> {
  int corba = 1;
  int anayemek = 1;
  int tatli = 1;

  List<Map<String, String>> corbaListesi = [
    {
      "ad": "Mercimek Çorbası",
      "tarif":
          "Mercimekleri haşlayın, soğan ve salça ile kavurup blenderdan geçirin.",
    },
    {
      "ad": "Tarhana Çorbası",
      "tarif": "Tarhanayı soğuk suda eritin, kaynayan suya ekleyip pişirin.",
    },
    {
      "ad": "Tavuk Suyu Çorbası",
      "tarif": "Didilmiş tavuk etlerini şehriye ile kaynatıp terbiye ekleyin.",
    },
    {
      "ad": "Düğün Çorbası",
      "tarif": "Kuzu etini haşlayıp didikleyin, yoğurtlu terbiye ile bağlayın.",
    },
    {
      "ad": "Yoğurtlu Çorba",
      "tarif": "Pirinçleri haşlayın, süzme yoğurt ve nane ile karıştırın.",
    },
  ];

  List<Map<String, String>> anaYemekListesi = [
    {
      "ad": "Karnıyarık",
      "tarif": "Patlıcanları kızartın, kıymalı harç ile doldurup fırınlayın.",
    },
    {
      "ad": "Kayseri Mantısı",
      "tarif":
          "Minik hamurları kıyma ile doldurun, haşlayıp yoğurtla servis edin.",
    },
    {
      "ad": "Kuru Fasulye",
      "tarif": "Fasulyeleri et ve bol salça ile kısık ateşte pişirin.",
    },
    {
      "ad": "İçli Köfte",
      "tarif": "Dışı bulgur, içi kıyma olan bu lezzeti hazırlayıp kızartın.",
    },
    {
      "ad": "Fırın Balık",
      "tarif": "Balıkları sebzelerle fırında zeytinyağı ile pişirin.",
    },
  ];

  List<Map<String, String>> tatliListesi = [
    {
      "ad": "Kadayıf",
      "tarif":
          "Kadayıfları tereyağı ile harmanlayın, fıstık ekleyip şerbet dökün.",
    },
    {
      "ad": "Baklava",
      "tarif": "İnce yufkaları dizin, ceviz serpin ve şerbetle buluşturun.",
    },
    {
      "ad": "Fırın Sütlaç",
      "tarif": "Süt ve pirinci pişirip kaplara paylaştırın, fırında yakın.",
    },
    {
      "ad": "Kazandibi",
      "tarif": "Muhallebinin altını tepside hafifçe yakarak hazırlayın.",
    },
    {
      "ad": "Maraş Dondurması",
      "tarif": "Bol sahlep ve keçi sütü ile dövülerek hazırlanan dondurma.",
    },
  ];

  void corbaDegistir() {
    setState(() {
      corba = Random().nextInt(corbaListesi.length) + 1;
    });
  }

  void anaYemekDegistir() {
    setState(() {
      anayemek = Random().nextInt(anaYemekListesi.length) + 1;
    });
  }

  void tatliDegistir() {
    setState(() {
      tatli = Random().nextInt(tatliListesi.length) + 1;
    });
  }

  void gununMenusunuGetir() {
    setState(() {
      corbaDegistir();
      anaYemekDegistir();
      tatliDegistir();
    });
  }

  void tarifPaneliniAc(String ad, String tarif) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
      ),
      backgroundColor: Color(0xFFFFFBF7),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              SizedBox(height: 20),
              Text(
                ad,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFFF5722),
                ),
              ),
              SizedBox(height: 15),
              Text(
                tarif,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  height: 1.4,
                  color: Colors.grey[800],
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        );
      },
    );
  }

  Widget yemekBolumu(
    String resimyolu,
    String yemekAdi,
    String tarif,
    VoidCallback tiklama,
  ) {
    return Container(
      height: 200,
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () => tarifPaneliniAc(yemekAdi, tarif),
              child: ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                child: Image.asset(
                  resimyolu,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: tiklama,
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 12.0),
              child: Text(
                yemekAdi,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFFF5722),
                ),
              ),
            ),
          ),
        ],
      ),
    );
=======
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
>>>>>>> 5bfdf3edede70da7a4b1828c1c77c4b84a79721e
  }

  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 20.0, bottom: 10),
          child: Text(
            "Kararsız mısın? Dokun ve Keşfet!",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w600,
              color: Colors.grey[700],
            ),
          ),
        ),

        yemekBolumu(
          "assets/corba_$corba.jpg",
          corbaListesi[corba - 1]["ad"]!,
          corbaListesi[corba - 1]["tarif"]!,
          corbaDegistir,
        ),
        yemekBolumu(
          "assets/yemek_$anayemek.jpg",
          anaYemekListesi[anayemek - 1]["ad"]!,
          anaYemekListesi[anayemek - 1]["tarif"]!,
          anaYemekDegistir,
        ),
        yemekBolumu(
          "assets/tatli_$tatli.jpg",
          tatliListesi[tatli - 1]["ad"]!,
          tatliListesi[tatli - 1]["tarif"]!,
          tatliDegistir,
        ),

        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: SizedBox(
            width: double.infinity,
            height: 55,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFFF5722),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                elevation: 5,
              ),
              onPressed: gununMenusunuGetir,
              child: Text(
                "GÜNÜN MENÜSÜNÜ OLUŞTUR",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 30),
      ],
=======
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
>>>>>>> 5bfdf3edede70da7a4b1828c1c77c4b84a79721e
    );
  }
}
