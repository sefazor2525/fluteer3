import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const BugunNeYesek());
}

class BugunNeYesek extends StatelessWidget {
  const BugunNeYesek({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color(0xFFFFFBF7),
        appBar: AppBar(
          backgroundColor: const Color(0xFFFFFBF7),
          elevation: 0,
          centerTitle: true,
          title: const Text(
            'Lezzet Durağı',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Color(0xFFFF5722),
            ),
          ),
        ),
        body: SingleChildScrollView(child: YemekSayfasi()),
      ),
    );
  }
}

class YemekSayfasi extends StatefulWidget {
  const YemekSayfasi({super.key});

  @override
  State<YemekSayfasi> createState() => _YemekSayfasiState();
}

class _YemekSayfasiState extends State<YemekSayfasi> {
  int corba = 1;
  int anayemek = 1;
  int tatli = 1;

  final List<Map<String, String>> corbaListesi = [
    {
      'ad': 'Mercimek Çorbası',
      'tarif':
          'Lokanta usulü tam kıvamında süzme mercimek çorbası için kollarımızı sıvıyoruz! Öncelikle 2 su bardağı kırmızı mercimeği iyice yıkayıp suyunu süzüyoruz. Bir tencerede 2 yemek kaşığı tereyağı ve 1 yemek kaşığı sıvı yağı kızdırıp, yemeklik doğranmış 1 adet orta boy soğanı şeffaflaşana kadar kavuruyoruz. Ardından 1 yemek kaşığı unu ekleyip unun kokusu çıkana kadar (yaklaşık 2 dakika) kavurmaya devam ediyoruz.'
          'Şimdi işin sırrına geliyoruz: Küp küp doğranmış 1 adet patates ve 1 adet havucu da ekleyip birkaç tur çeviriyoruz. Yıkadığımız mercimekleri tencereye alıp üzerine 1,5 litre sıcak su (varsa et veya tavuk suyu harika olur) ekliyoruz. Tuz, karabiber ve bir çay kaşığı zerdeçal (o altın sarısı renk için şart!) ilave edip sebzeler yumuşayana kadar orta ateşte pişirmeye bırakıyoruz.'
          'Tüm sebzeler piştikten sonra çorbamızı pürüzsüz bir kıvam alana kadar blenderdan geçiriyoruz. Eğer kıvamı çok koyu gelirse biraz daha sıcak su ekleyerek açabilirsiniz. Servis yapmadan hemen önce küçük bir tavada tereyağını kızdırıp üzerine pul biber ve nane ekleyerek yakıyoruz. Çorbayı kaselere paylaştırdıktan sonra bu nefis sosu üzerinde gezdiriyoruz. Yanına bir dilim limon ve kıtır ekmekle servis edilince tadından yenmez! Afiyet olsun kanka, bak bakalım kutuya sığacak mı?',
    },
    {
      'ad': 'Tarhana Çorbası',
      'tarif': 'Tarhanayı soğuk suda eritin, kaynayan suya ekleyip pişirin.',
    },
    {
      'ad': 'Tavuk Suyu Çorbası',
      'tarif':
          'Öncelikle tavukları haşlıyoruz. Ben küçük bir tencerede az miktarda yaptığım için ölçü böyle ve tavuk az siz miktarı ve tavuğu arttırıp daha fazla yapın, her şeyin 2 katı size ölçü olabilir. Bu ölçüler ile minik bir tencere çıkıyor.',
    },
    {
      'ad': 'Düğün Çorbası',
      'tarif':
          'Kuzu etini haşlayıp didikleyin, yoğurtlu terbiye ile bağlayın.Başka bir yerde bir yumurta sarısı ve yarım limon suyu ile terbiye hazırlayalım.',
    },
    {
      'ad': 'Yoğurtlu Çorba',
      'tarif': 'Pirinçleri haşlayın, süzme yoğurt ve nane ile karıştırın.',
    },
  ];

  final List<Map<String, String>> anaYemekListesi = [
    {
      'ad': 'Karnıyarık',
      'tarif': 'Patlıcanları kızartın, kıymalı harç ile doldurup fırınlayın.',
    },
    {
      'ad': 'Kayseri Mantısı',
      'tarif':
          'Minik hamurları kıyma ile doldurun, haşlayıp yoğurtla servis edin.',
    },
    {
      'ad': 'Kuru Fasulye',
      'tarif': 'Fasulyeleri et ve bol salça ile kısık ateşte pişirin.',
    },
    {
      'ad': 'İçli Köfte',
      'tarif': 'Dışı bulgur, içi kıyma olan bu lezzeti hazırlayıp kızartın.',
    },
    {
      'ad': 'Fırın Balık',
      'tarif': 'Balıkları sebzelerle fırında zeytinyağı ile pişirin.',
    },
  ];

  final List<Map<String, String>> tatliListesi = [
    {
      'ad': 'Kadayıf',
      'tarif':
          'Kadayıfları tereyağı ile harmanlayın, fıstık ekleyip şerbet dökün.',
    },
    {
      'ad': 'Baklava',
      'tarif': 'İnce yufkaları dizin, ceviz serpin ve şerbetle buluşturun.',
    },
    {
      'ad': 'Fırın Sütlaç',
      'tarif': 'Süt ve pirinci pişirip kaplara paylaştırın, fırında yakın.',
    },
    {
      'ad': 'Kazandibi',
      'tarif': 'Muhallebinin altını tepside hafifçe yakarak hazırlayın.',
    },
    {
      'ad': 'Maraş Dondurması',
      'tarif': 'Bol sahlep ve keçi sütü ile dövülerek hazırlanan dondurma.',
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
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
      ),
      backgroundColor: const Color(0xFFFFFBF7),
      builder: (context) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.5,
          padding: const EdgeInsets.all(25.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colors.orange.shade50),
                ),
                child: SingleChildScrollView(
                  child: Text(
                    tarif,
                    style: TextStyle(
                      fontSize: 16,
                      height: 1.6,
                      color: Colors.grey[800],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              Text(
                ad,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFFF5722),
                ),
              ),
              const SizedBox(height: 15),
              Expanded(
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Colors.orange.shade50),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Row(
                          children: [
                            Icon(
                              Icons.restaurant_menu,
                              color: Color(0xFFFF5722),
                            ),
                            SizedBox(width: 8),
                            Text(
                              'Tarif',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFFFF5722),
                              ),
                            ),
                          ],
                        ),
                        const Divider(height: 20, thickness: 1),
                        ...tarif.split('.').where((s) => s.trim().isNotEmpty).map(
                          (adim) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 8.0,
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Turuncu onay ikonu
                                  Container(
                                    margin: const EdgeInsets.only(top: 4),
                                    decoration: const BoxDecoration(
                                      color: Color(0xFFFFE0B2),
                                      shape: BoxShape.circle,
                                    ),
                                    child: const Icon(
                                      Icons.check,
                                      size: 16,
                                      color: Color(0xFFFF5722),
                                    ),
                                  ),
                                  const SizedBox(width: 12),
                                  // Adım metni
                                  Expanded(
                                    child: Text(
                                      "${adim.trim()}.", // Noktayı geri ekledik
                                      style: TextStyle(
                                        fontSize: 16,
                                        height: 1.5,
                                        color: Colors.grey[800],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
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
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          const BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.05),
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
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(20),
                ),
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
                style: const TextStyle(
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
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 20.0, bottom: 10),
          child: Text(
            'Kararsız mısın? Dokun ve Keşfet!',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w600,
              color: Colors.grey[700],
            ),
          ),
        ),
        yemekBolumu(
          'assets/corba_$corba.jpg',
          corbaListesi[corba - 1]['ad']!,
          corbaListesi[corba - 1]['tarif']!,
          corbaDegistir,
        ),
        yemekBolumu(
          'assets/yemek_$anayemek.jpg',
          anaYemekListesi[anayemek - 1]['ad']!,
          anaYemekListesi[anayemek - 1]['tarif']!,
          anaYemekDegistir,
        ),
        yemekBolumu(
          'assets/tatli_$tatli.jpg',
          tatliListesi[tatli - 1]['ad']!,
          tatliListesi[tatli - 1]['tarif']!,
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
                backgroundColor: const Color(0xFFFF5722),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                elevation: 5,
              ),
              onPressed: gununMenusunuGetir,
              child: const Text(
                'GÜNÜN MENÜSÜNÜ OLUŞTUR',
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
    );
  }
}
