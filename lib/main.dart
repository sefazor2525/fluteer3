import 'dart:math';
import 'tarif_verileri.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const BugunNeYesek());
}

class BugunNeYesek extends StatelessWidget {
  const BugunNeYesek({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: AnaEkran());
  }
}

class AnaEkran extends StatefulWidget {
  const AnaEkran({super.key});

  @override
  State<AnaEkran> createState() => _AnaEkranState();
}

class _AnaEkranState extends State<AnaEkran> {
  int _seciliSayfa = 0;

  late List<Widget> _sayfalar;

  @override
  void initState() {
    super.initState();
    _sayfalar = [
      const YemekSayfasi(),
      const KoleksiyonSayfasi(),
      const TopluluguSayfasi(),
      const ProfilSayfasi(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: _sayfalar[_seciliSayfa],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _seciliSayfa,
        onTap: (index) {
          setState(() {
            _seciliSayfa = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color(0xFFFF5722),
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Ana Sayfa'),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark),
            label: 'Koleksiyon',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.people), label: 'Topluluk'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profil'),
        ],
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
  int secilisayfa = 0;

  // Favori ve Kategori
  Set<String> favoriler = {};
  late SharedPreferences prefs;
  String kategoriBirimi = 'geleneksel'; // 'geleneksel' or 'viral'

  @override
  void initState() {
    super.initState();
    _loadFavorites();
  }

  void sayfaDegistir(int index) {
    setState(() {
      secilisayfa = index;
    });
  }

  Future<void> _loadFavorites() async {
    prefs = await SharedPreferences.getInstance();
    setState(() {
      favoriler = Set<String>.from(prefs.getStringList('favoriler') ?? []);
    });
  }

  Future<void> _toggleFavori(String tarifAdi) async {
    setState(() {
      if (favoriler.contains(tarifAdi)) {
        favoriler.remove(tarifAdi);
      } else {
        favoriler.add(tarifAdi);
      }
    });
    await prefs.setStringList('favoriler', favoriler.toList());
  }

  void _toggleKategori(String yeniKategori) {
    setState(() {
      kategoriBirimi = yeniKategori;
      corba = 1;
      anayemek = 1;
      tatli = 1;
    });
  }

  List<Map<String, dynamic>> getCurrentCorbaList() {
    return kategoriBirimi == 'viral' ? viralCorbaListesi : corbaListesi;
  }

  List<Map<String, dynamic>> getCurrentAnaYemekList() {
    return kategoriBirimi == 'viral' ? viralAnaYemekListesi : anaYemekListesi;
  }

  List<Map<String, dynamic>> getCurrentTatliList() {
    return kategoriBirimi == 'viral' ? viralTatliListesi : tatliListesi;
  }

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

  void tarifPaneliniAc(String ad, Map<String, dynamic> tarifDetaylari) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
      ),
      backgroundColor: const Color(0xFFFFFBF7),
      builder: (context) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.85,
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.grey[400],
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      ad,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFFF5722),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      _toggleFavori(ad);
                      Navigator.pop(context);
                    },
                    child: Icon(
                      favoriler.contains(ad)
                          ? Icons.favorite
                          : Icons.favorite_border,
                      color: const Color(0xFFFF5722),
                      size: 28,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              // Bilgi kartları
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _infoCard(
                    '⏱️',
                    tarifDetaylari['hazirlasuresi'] ?? 'N/A',
                    'Hazırlık',
                  ),
                  _infoCard(
                    '🔥',
                    tarifDetaylari['pisirmesuresi'] ?? 'N/A',
                    'Pişirme',
                  ),
                  _infoCard('⭐', tarifDetaylari['zorluk'] ?? 'N/A', 'Zorluk'),
                  _infoCard(
                    '👥',
                    tarifDetaylari['kisisayisi'] ?? 'N/A',
                    'Kişi',
                  ),
                ],
              ),
              const SizedBox(height: 15),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Kalori
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.orange.shade50,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.local_fire_department,
                              color: Color(0xFFFF5722),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              'Kalori: ${tarifDetaylari['kalori'] ?? 'N/A'}',
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFFFF5722),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      // Malzemeler
                      const Row(
                        children: [
                          Icon(Icons.shopping_basket, color: Color(0xFFFF5722)),
                          SizedBox(width: 8),
                          Text(
                            'Malzemeler',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFFFF5722),
                            ),
                          ),
                        ],
                      ),
                      const Divider(height: 15, thickness: 1),
                      ...(tarifDetaylari['malzemeler'] as List?)?.map(
                            (malzeme) => Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 6.0,
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(top: 6),
                                    decoration: const BoxDecoration(
                                      color: Color(0xFFFFE0B2),
                                      shape: BoxShape.circle,
                                    ),
                                    child: const Icon(
                                      Icons.check,
                                      size: 14,
                                      color: Color(0xFFFF5722),
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  Expanded(
                                    child: Text(
                                      malzeme,
                                      style: TextStyle(
                                        fontSize: 14,
                                        height: 1.5,
                                        color: Colors.grey[800],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ) ??
                          [],
                      const SizedBox(height: 20),
                      // Tarif
                      const Row(
                        children: [
                          Icon(Icons.restaurant_menu, color: Color(0xFFFF5722)),
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
                      const Divider(height: 15, thickness: 1),
                      Text(
                        tarifDetaylari['tarif'] ?? 'Tarif bulunamadı',
                        style: TextStyle(
                          fontSize: 14,
                          height: 1.6,
                          color: Colors.grey[800],
                        ),
                        textAlign: TextAlign.justify,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _infoCard(String icon, String value, String label) {
    return Column(
      children: [
        Text(icon, style: const TextStyle(fontSize: 24)),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: Color(0xFFFF5722),
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 2),
        Text(label, style: TextStyle(fontSize: 10, color: Colors.grey[600])),
      ],
    );
  }

  Widget yemekBolumu(
    String resimyolu,
    String yemekAdi,
    Map<String, dynamic> tarifDetaylari,
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
              onTap: () => tarifPaneliniAc(yemekAdi, tarifDetaylari),
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(20),
                    ),
                    child: Image.asset(
                      resimyolu,
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                  ),
                  if (tarifDetaylari['viral'] == true)
                    Positioned(
                      top: 10,
                      right: 10,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 5,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.red.withValues(alpha: 0.9),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Row(
                          children: [
                            Text('🔥', style: TextStyle(fontSize: 16)),
                            SizedBox(width: 4),
                            Text(
                              'Viral',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                ],
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
        // Kategori Seçimi
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
          child: Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () => _toggleKategori('geleneksel'),
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                      color: kategoriBirimi == 'geleneksel'
                          ? const Color(0xFFFF5722)
                          : Colors.grey[200],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      'Geleneksel',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: kategoriBirimi == 'geleneksel'
                            ? Colors.white
                            : Colors.grey[700],
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: GestureDetector(
                  onTap: () => _toggleKategori('viral'),
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                      color: kategoriBirimi == 'viral'
                          ? Colors.red
                          : Colors.grey[200],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      '🔥 Viral',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: kategoriBirimi == 'viral'
                            ? Colors.white
                            : Colors.grey[700],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        yemekBolumu(
          'assets/corba_$corba.jpg',
          getCurrentCorbaList()[corba - 1]['ad']!,
          getCurrentCorbaList()[corba - 1],
          corbaDegistir,
        ),
        yemekBolumu(
          'assets/yemek_$anayemek.jpg',
          getCurrentAnaYemekList()[anayemek - 1]['ad']!,
          getCurrentAnaYemekList()[anayemek - 1],
          anaYemekDegistir,
        ),
        yemekBolumu(
          'assets/tatli_$tatli.jpg',
          getCurrentTatliList()[tatli - 1]['ad']!,
          getCurrentTatliList()[tatli - 1],
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

class KoleksiyonSayfasi extends StatelessWidget {
  const KoleksiyonSayfasi({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Koleksiyon',
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
    );
  }
}

class TopluluguSayfasi extends StatelessWidget {
  const TopluluguSayfasi({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Topluluk',
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
    );
  }
}

class ProfilSayfasi extends StatelessWidget {
  const ProfilSayfasi({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Profil',
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
    );
  }
}
