import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

  // Favori ve Kategori
  Set<String> favoriler = {};
  late SharedPreferences prefs;
  String kategoriBirimi = 'geleneksel'; // 'geleneksel' or 'viral'

  @override
  void initState() {
    super.initState();
    _loadFavorites();
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

  final List<Map<String, dynamic>> corbaListesi = [
    {
      'ad': 'Mercimek Çorbası',
      'tarif':
          'Lokanta usulü tam kıvamında süzme mercimek çorbası için kollarımızı sıvıyoruz! Öncelikle 2 su bardağı kırmızı mercimeği iyice yıkayıp suyunu süzüyoruz. Bir tencerede 2 yemek kaşığı tereyağı ve 1 yemek kaşığı sıvı yağı kızdırıp, yemeklik doğranmış 1 adet orta boy soğanı şeffaflaşana kadar kavuruyoruz. Ardından 1 yemek kaşığı unu ekleyip unun kokusu çıkana kadar (yaklaşık 2 dakika) kavurmaya devam ediyoruz. Şimdi işin sırrına geliyoruz: Küp küp doğranmış 1 adet patates ve 1 adet havucu da ekleyip birkaç tur çeviriyoruz. Yıkadığımız mercimekleri tencereye alıp üzerine 1,5 litre sıcak su (varsa et veya tavuk suyu harika olur) ekliyoruz. Tuz, karabiber ve bir çay kaşığı zerdeçal (o altın sarısı renk için şart!) ilave edip sebzeler yumuşayana kadar orta ateşte pişirmeye bırakıyoruz. Tüm sebzeler piştikten sonra çorbamızı pürüzsüz bir kıvam alana kadar blenderdan geçiriyoruz. Eğer kıvamı çok koyu gelirse biraz daha sıcak su ekleyerek açabilirsiniz. Servis yapmadan hemen önce küçük bir tavada tereyağını kızdırıp üzerine pul biber ve nane ekleyerek yakıyoruz. Çorbayı kaselere paylaştırdıktan sonra bu nefis sosu üzerinde gezdiriyoruz. Yanına bir dilim limon ve kıtır ekmekle servis edilince tadından yenmez!',
      'malzemeler': [
        '2 su bardağı kırmızı mercimek',
        '2 yemek kaşığı tereyağı',
        '1 yemek kaşığı sıvı yağ',
        '1 adet orta boy soğan',
        '1 yemek kaşığı un',
        '1 adet patates',
        '1 adet havuç',
        '1,5 litre su (veya et suyu)',
        'Tuz, karabiber, zerdeçal',
        'Pul biber ve nane (sos için)',
      ],
      'hazirlasuresi': '10 dk',
      'pisirmesuresi': '35 dk',
      'zorluk': 'Orta',
      'kisisayisi': '4-6',
      'kalori': '120 kcal',
    },
    {
      'ad': 'Tarhana Çorbası',
      'tarif':
          'Tarhana, Anadolu\'nun geleneksel hazırlanmış kuru bir ürünüdür. Soğuk suda eritilen tarhana, kaynayan suya yavaşça eklenerek homojen bir kıvam elde edilir. Kısık ateşte 15 dakika kadar pişirildikten sonra, tereyağında kızartılmış pul biber ile servis edilir. Bu basit ama doyurucu çorba, her mevsimde tüketilir.',
      'malzemeler': [
        '3 yemek kaşığı tarhana',
        '1 litre su',
        '2 yemek kaşığı tereyağı',
        '1 çay kaşığı pul biber',
        'Tuz, karabiber',
      ],
      'hazirlasuresi': '5 dk',
      'pisirmesuresi': '15 dk',
      'zorluk': 'Kolay',
      'kisisayisi': '3-4',
      'kalori': '95 kcal',
    },
    {
      'ad': 'Tavuk Suyu Çorbası',
      'tarif':
          'Tavuk suyu çorbası, haşlanmış tavuktan yapılmış sağlıklı ve besleyici bir çorbadır. Tavuk etleri haşlandıktan sonra didiklenerek, çorba suyu içine katılır. Pirinç ve sebzelerle zenginleştirilen bu çorba, limon ve nane ile tamamlanır. Özellikle hastalık dönemlerinde besleyici bir seçim olarak tüketilir.',
      'malzemeler': [
        '500 gram tavuk göğsü',
        '1 litre su',
        '1/2 su bardağı pirinç',
        '1 adet havuç',
        '2 adet patates',
        '1 adet soğan',
        'Limon, tuz, karabiber',
        'Taze nane (servis için)',
      ],
      'hazirlasuresi': '15 dk',
      'pisirmesuresi': '30 dk',
      'zorluk': 'Kolay',
      'kisisayisi': '4-5',
      'kalori': '140 kcal',
    },
    {
      'ad': 'Düğün Çorbası',
      'tarif':
          'Düğün çorbası, özel günlerde yapılan ve yoğurt terbiyesiyle hazırlanan lezzetli bir çorbadır. Kuzu etinden hazırlanan et veya sebze suyu, yoğurt ve yumurta karışımıyla bağlanır. Tavada kızartılan pul biber ve nane ile sunulan bu çorba, şerefe içilir ve törensel bir anlamı vardır.',
      'malzemeler': [
        '500 gram kuzu eti',
        '1 litre su',
        '500 gram süzme yoğurt',
        '2 adet yumurta (sarısı)',
        '2 yemek kaşığı un',
        '2 yemek kaşığı tereyağı',
        'Pul biber, nane',
        'Limon suyu, tuz, karabiber',
      ],
      'hazirlasuresi': '20 dk',
      'pisirmesuresi': '40 dk',
      'zorluk': 'Zor',
      'kisisayisi': '6-8',
      'kalori': '155 kcal',
    },
    {
      'ad': 'Yoğurtlu Çorba',
      'tarif':
          'Yoğurtlu çorba, pirinçle yapılan besleyici ve hafif bir çorbadır. Pirinçler haşlandıktan sonra, taze yoğurt ve sebzeler eklenir. Tuz ve baharat ile tatlandırılan bu çorba, sıcak servisi yapılır. Taze nane yaprakları ve ceviz parçaları ile garnır edilerek sunulur.',
      'malzemeler': [
        '1/2 su bardağı pirinç',
        '1 litre tavuk suyu',
        '500 gram süzme yoğurt',
        '2 adet yumurta',
        '2 yemek kaşığı un',
        '1 yemek kaşığı tereyağı',
        'Taze nane, dill',
        'Tuz, karabiber, sumak',
      ],
      'hazirlasuresi': '10 dk',
      'pisirmesuresi': '25 dk',
      'zorluk': 'Kolay',
      'kisisayisi': '4-6',
      'kalori': '130 kcal',
    },
  ];

  final List<Map<String, dynamic>> anaYemekListesi = [
    {
      'ad': 'Karnıyarık',
      'tarif':
          'Karnıyarık, Türk mutfağının en meşhur yemeklerinden biridir. Uzun patlıcanlar çöpte kızartılıp içleri boş bırakılırken, diğer taraftan taze kıyma, soğan ve domates ile hazırlanan harç yapılır. Boş patlıcanlar bu kıymalı harçla doldurulur, ardından fırında poğaça-çomlek ateşinde pişirilir. Üzerine domates sosu dökülüp servisi yapılır. Yanında pirinç pilavı ve yoğurt ile sunulur.',
      'malzemeler': [
        '6 adet uzun patlıcan',
        '500 gram kıyma',
        '2 adet orta boy soğan',
        '3 adet domates',
        '1/2 su bardağı ıspanak',
        '1/4 çay kaşığı tarçın',
        'Sıvı yağ, tuz, karabiber',
        'Domates sosu (1 su bardağı)',
      ],
      'hazirlasuresi': '25 dk',
      'pisirmesuresi': '40 dk',
      'zorluk': 'Orta',
      'kisisayisi': '4-5',
      'kalori': '280 kcal',
    },
    {
      'ad': 'Kayseri Mantısı',
      'tarif':
          'Kayseri mantısı, harç yapılan minik hamur parçalarının özel bir şekilde yapıldığı ve yoğurtla servis edilen bir yemektir. İnce açılan hamur karesel parçalar halinde kesilip taze kıyma ve baharat ile doldurulur. Haşlamada dikkat edilmeli, açılan hamurlar bir tabaka halinde yapıştırılmış şekilde kaynayan suya eklenir. Haşlandıktan sonra süzülen mantılar, üzerine kızdırılan kırmızı biber ve nane saçılan yoğurtla sunulur.',
      'malzemeler': [
        '3 su bardağı un',
        '1 adet yumurta',
        'Tuz, su (hamur için)',
        '500 gram kıyma',
        '1 adet soğan',
        '1 çay kaşığı pul biber',
        '1 kg süzme yoğurt',
        'Nane, kırmızı biber, tereyağı',
      ],
      'hazirlasuresi': '45 dk',
      'pisirmesuresi': '20 dk',
      'zorluk': 'Zor',
      'kisisayisi': '6-8',
      'kalori': '320 kcal',
    },
    {
      'ad': 'Kuru Fasulye',
      'tarif':
          'Kuru fasulye, Türk mutfağının en besleyici ve doldurici yemeklerinden biridir. Gece önceden bekletilen kuru fasulyelerin suyu değiştirilip taze suyla haşlanmasıyla başlanır. Eti küçük parçalara doğranan dana etleri kavurma yapılıp içine katılır. Ardından domates salçası, soğan, sarımsak ve baharatlar ilave edilir. Düşük ateşte 2-3 saat pişirilmesi sonucunda lezzetli bir yemek hazır olur.',
      'malzemeler': [
        '500 gram kuru fasulye',
        '400 gram dana eti',
        '3 yemek kaşığı domates salçası',
        '2 adet soğan',
        '3 diş sarımsak',
        '1/2 çay kaşığı pul biber',
        'Sıvı yağ, tuz, karabiber, bay yaprakları',
      ],
      'hazirlasuresi': '20 dk',
      'pisirmesuresi': '120 dk',
      'zorluk': 'Kolay',
      'kisisayisi': '6-8',
      'kalori': '240 kcal',
    },
    {
      'ad': 'İçli Köfte',
      'tarif':
          'İçli köfte, bulgurdan yapılan dışı ve içinde kıyma olan harçla doldurulmuş bir yemektir. Bulgur, tuz ve baharatlarla ıslatılıp yoğrulur. Ayrıca kıyma, soğan, fistık ve sumaktan yapılan harç hazırlanır. Bulgur hamurundan oval şekiller yapılıp içleri boş bırakılır, bu boşluklara kıyma harcı doldurulur. Sıcak yağda kızartılarak sarı rengini alana kadar pişirilir.',
      'malzemeler': [
        '2 su bardağı bulgur',
        '1 litre su (bulgur için)',
        '500 gram kıyma (dış)',
        '300 gram kıyma (iç)',
        '2 adet soğan',
        '1/2 su bardağı fistık',
        '1 çay kaşığı sumak',
        'Tuz, karabiber, kimyon, sıvı yağ',
      ],
      'hazirlasuresi': '30 dk',
      'pisirmesuresi': '20 dk',
      'zorluk': 'Zor',
      'kisisayisi': '5-6',
      'kalori': '350 kcal',
    },
    {
      'ad': 'Fırın Balık',
      'tarif':
          'Fırın balığı, taze balık ve sebzelerin zeytinyağıyla fırında pişirildiği sağlıklı bir yemektir. Temizlenen balık, içi ve dışı tuz, karabiber ile baharat yapılır. Fırına alınmış bir tepsiye domates, soğan, limon dilimleri ve fesleğen yayılır. Balık bu sebzelerin üzerine konur, üzerine daha fazla sebze ve limon konarak zeytinyağı dökülür. 180 derece fırında yaklaşık 25-30 dakika pişirilir.',
      'malzemeler': [
        '1 adet 1 kg balık (çipura, levrek vs)',
        '3 adet domates',
        '2 adet soğan',
        '1 adet limon',
        '1/2 su bardağı zeytinyağı',
        'Taze fesleğen, dill',
        'Tuz, karabiber, pul biber',
      ],
      'hazirlasuresi': '15 dk',
      'pisirmesuresi': '30 mk',
      'zorluk': 'Orta',
      'kisisayisi': '4-5',
      'kalori': '220 kcal',
    },
  ];

  final List<Map<String, dynamic>> tatliListesi = [
    {
      'ad': 'Kadayıf',
      'tarif':
          'Kadayıf, tel tatlısı olarak da bilinen ve ince teller halinde hamurdan yapılan bir tatlıdır. Hazır kadayıf, tereyağı ile harmanlanan ve üzerine yer fıstığı veya antep fıstığı serpilen bir tepsiye yayılır. 180 derece fırında kızarıncaya kadar pişirilir. Tatlı fırından çıkarıldığında hemen üzerine sıcak şerbeti dökülür. Bu işlem, tatlının şerbeti içinde iyi bir şekilde emebilmesini sağlar. Üst tarafına fistik ve ceviz dekorasyonu yapılır.',
      'malzemeler': [
        '500 gram hazır kadayıf',
        '300 gram tereyağı',
        '1 su bardağı yer fıstığı',
        '1 su bardağı antep fıstığı',
        '3 su bardağı şeker',
        '1,5 su bardağı su',
        '1/2 limon suyu',
        '5-6 adet çiçek (dekorasyon)',
      ],
      'hazirlasuresi': '15 dk',
      'pisirmesuresi': '30 mk',
      'zorluk': 'Orta',
      'kisisayisi': '8-10',
      'kalori': '350 kcal',
    },
    {
      'ad': 'Baklava',
      'tarif':
          'Baklava, Türk mutfağının en ünlü tatlısıdır. İnce yufkalar bir tepsiye katman halinde yerleştirilir, her iki yufka arasına tereyağı sürülür. Ceviz veya fistik parçaları her katman arasına serpilir. Yufkalar bittikten sonra baklava elmas veya kare şekiller halinde kesilerek fırına alınır. Yaklaşık 35-40 dakika 180 derece fırında pişirilmesi sonucunda altı açık rengini alır. Fırından çıkarıldığında hemen üzerine soğuk veya ılık şerbeti dökülür.',
      'malzemeler': [
        '1 paket yufka',
        '300 gram tereyağı (eritilmiş)',
        '2 su bardağı ceviz',
        '1 su bardağı fistik',
        '1 çay kaşığı tarçın',
        '4 su bardağı şeker',
        '2 su bardağı su',
        '1 limon suyu',
      ],
      'hazirlasuresi': '30 mk',
      'pisirmesuresi': '40 mk',
      'zorluk': 'Zor',
      'kisisayisi': '10-12',
      'kalori': '380 kcal',
    },
    {
      'ad': 'Fırın Sütlaç',
      'tarif':
          'Fırın sütlaçı, pirinç ve sütten yapılan besleyici ve yumuşak bir tatlıdır. Pirinçler iyice yıkandıktan sonra bir tencereye alınıp su ile biraz haşlanır. Yumuşayan pirinçlere, şeker ve süt ilave edilir. Bu karışım, kıtar kıtar dönerken mısır nişastası hamuru eklenip karıştırılır. Süt karışımı kalınlaştığında, önceden tereyağı ile sürülmüş kaplara paylaştırılır. Fırında ılık bir şekilde pişirilen sütlaç, üzerine tarçın serpilip soğumaya bırakılır.',
      'malzemeler': [
        '1 su bardağı pirinç',
        '1 litre süt',
        '1/2 su bardağı şeker',
        '3 yemek kaşığı mısır nişastası',
        '2 yemek kaşığı su',
        '2 yemek kaşığı tereyağı',
        '1 çay kaşığı tarçın (dekorasyon)',
      ],
      'hazirlasuresi': '20 dk',
      'pisirmesuresi': '35 mk',
      'zorluk': 'Kolay',
      'kisisayisi': '6-8',
      'kalori': '220 kcal',
    },
    {
      'ad': 'Kazandibi',
      'tarif':
          'Kazandibi, muhallebi tatlısının altının tepside hafifçe yakılarak hazırlandığı bir tatlıdır. Başta muhallebi hazırlanır: süt, şeker ve mısır nişastası karıştırılarak pişirilir. Muhallebi kalınlaştığında, üzerine toz fistik serpilir. Muhallebi, önceden tereyağı ile sürülmüş geniş ve sı tepsiyle aktarılır. Muhallebi soğuduktan sonra, tepsiniz altında biraz yakarsak altı hafif kızararak lezzetli bir kabuk oluşur. Bu lezzet taze servis edilir.',
      'malzemeler': [
        '1 litre süt',
        '1/2 su bardağı şeker',
        '4 yemek kaşığı mısır nişastası',
        '3 yemek kaşığı su',
        '2 yemek kaşığı tereyağı',
        '1 su bardağı toz fistik',
        '1 çay kaşığı vanilya',
      ],
      'hazirlasuresi': '15 mk',
      'pisirmesuresi': '25 mk',
      'zorluk': 'Orta',
      'kisisayisi': '8-10',
      'kalori': '280 kcal',
    },
    {
      'ad': 'Maraş Dondurması',
      'tarif':
          'Maraş dondurması, bol sahlep ve keçi sütü kullanılarak yapılan ve türnası ile dövülerek katılaştırılan özel bir dondurmadır. Dondurma, klasik dondurmadan farklı olarak dondurulurken özel makinalarla ısıtılan bir taşta dövülür ve buna sahilep (orchid unu) karıştırılır. Bu işlem, dondurmanın kalınlığını ve özel tekstürünü oluşturur. Kahvaltı veya tatlı olarak sunulan bu lezzet, bazı yerlerde tel rölatası ve fıstıkla servis edilir.',
      'malzemeler': [
        '1 litre süt',
        '1/2 su bardağı şeker',
        '3 yemek kaşığı sahilep (orchid unu)',
        '1/4 su bardağı keçi sütü (varsa)',
        '1 çay kaşığı vanilya',
        '1 su bardağı toz fistik',
        '1/2 su bardağı çikolata (isteğe bağlı)',
      ],
      'hazirlasuresi': '20 mk',
      'pisirmesuresi': '360 mk (donma süresi)',
      'zorluk': 'Zor',
      'kisisayisi': '6-8',
      'kalori': '180 kcal',
    },
  ];

  // Viral Tarifler
  final List<Map<String, dynamic>> viralCorbaListesi = [
    {
      'ad': 'Dalgona Kahvesi',
      'tarif':
          'Dalgona kahvesi, TikTok ve Instagram\'da viral olan ve 1 milyardan fazla görünüş alan basit bir kahve tarifidir. Instant kahve, şeker ve su eşit miktarda karıştırılıp elektrikli mikserle çırpılır. Yaklaşık 5-10 dakika çırpıldığında koyu kahverengi, akıcı bir krem oluşur. Bardağa soğuk veya sıcak su dökülüp üzerine bu köpüklü kahve kıvamı eklenir. Üzerine kakao tozu ve çikolatanın servis edilir. İdeal sıcaklıkta sunulan bu kahve, sosyal medyada viral olmuştur.',
      'malzemeler': [
        '2 çorba kaşığı instant kahve',
        '2 çorba kaşığı şeker',
        '2 çorba kaşığı sıcak su',
        '1 su bardağı soğuk veya sıcak süt',
        'Kakao tozu (dekorasyon)',
        'Buz (isteğe bağlı)',
      ],
      'hazirlasuresi': '15 dk',
      'pisirmesuresi': '0 dk',
      'zorluk': 'Kolay',
      'kisisayisi': '1-2',
      'kalori': '80 kcal',
      'viral': true,
    },
    {
      'ad': 'Açılı Çikolata Küresi',
      'tarif':
          'Açılı çikolata küresi, Instagram\'da viral olan ve orta sınıfta 2 milyondan fazla beğeni alan bir tatlıdır. Bazlama hamuru ve çikolata ile hazırlanan bu tarif, çok kolay ve hızlı yapılır. Hazır bazlama hamuru açılıp içi çikolata ve marshmallow ile doldurulur. Fırında pişirildiğinde çikolata erimiş şekilde kurşun açılır. Sıcak çikolata çeşmesi gibi akıp gözle görülür. Bu anı video çekmek için ideal olan tarif, sosyal medyada çok paylaşılır.',
      'malzemeler': [
        '2 paket hazır bazlama',
        '100 gram çikolata (parça)',
        '50 gram marshmallow',
        '1 yumurta (fırça için)',
        'Şeker (üst için)',
      ],
      'hazirlasuresi': '10 dk',
      'pisirmesuresi': '25 dk',
      'zorluk': 'Çok Kolay',
      'kisisayisi': '2-3',
      'kalori': '280 kcal',
      'viral': true,
    },
    {
      'ad': 'Nutella Cheesecake',
      'tarif':
          '3 malzeme ile yapılan Nutella cheesecake, YouTube\'da viral olan bir tatlıdır. Sadece cream cheese, Nutella ve yumurta ile hazırlanan bu tatlı, şaşırtıcı ölçüde lezzetli çıkar. Tüm malzemeler karıştırıldıktan sonra hazır bastırma konursa yapılmış tepsiye dökülür ve fırında pişirilir. Soğuduktan sonra bir çikolataya sahip olur. Diş doku ve tadı profesyonel pastane kalitesindedir.',
      'malzemeler': [
        '200 gram cream cheese',
        '200 gram Nutella',
        '2 adet yumurta',
        '150 gram basırma bisküvisi (taban)',
        '100 gram tereyağı (taban)',
      ],
      'hazirlasuresi': '15 dk',
      'pisirmesuresi': '30 mk',
      'zorluk': 'Çok Kolay',
      'kisisayisi': '6-8',
      'kalori': '350 kcal',
      'viral': true,
    },
  ];

  final List<Map<String, dynamic>> viralAnaYemekListesi = [
    {
      'ad': 'Sucuk Sarıyer',
      'tarif':
          'Sucuk Sarıyer, Istanbul\'un ünlü sokak yemegi olup, internet\'te viral olmuş bir yemektir. Kızarılmış sucuk, erimiş peynirin üzerine konup kepekli ekmek ile servis edilir. Bazen sucuk ve peynir bir tost makinasında yan yana şekillendirilir ve kıtır kıtır bir dış katmanı olur. Çok basit ama çok etkili bir kombinasyon olan bu yemek, hızlı ve ucuz yapılır.',
      'malzemeler': [
        '4 dilim sucuk',
        '100 gram kaşar peyniri',
        '4 dilim kepekli ekmek',
        '1 yemek kaşığı tereyağı',
        'Tuz, karabiber',
      ],
      'hazirlasuresi': '5 dk',
      'pisirmesuresi': '10 mk',
      'zorluk': 'Çok Kolay',
      'kisisayisi': '2',
      'kalori': '320 kcal',
      'viral': true,
    },
    {
      'ad': 'Kek Gömlekli Hamburger',
      'tarif':
          'Kek gömlekli hamburger, sosyal medyada viral olan ve milyonlarca kez izlenen bir tarifidir. Normal hamburger ekmeği yerine ince kek dilimleri kullanılır. Arada hamburger köfteleri, peynir ve diğer malzemeler konur. Sonra kek gömlekli hamburger tamamı sos ile ballandırılıp servisi yapılır. Tatlı ve tuzlu karışımı ilginç bir lezzet kombinasyonu oluşturur.',
      'malzemeler': [
        '2 dilim hafif tatlı kek',
        '200 gram burger köftesi',
        '1 dilim peynir',
        '2 dilim domates',
        '2 yaprak marul',
        'Ketchup, mayonez, hardal',
      ],
      'hazirlasuresi': '10 mk',
      'pisirmesuresi': '15 mk',
      'zorluk': 'Kolay',
      'kisisayisi': '1-2',
      'kalori': '450 kcal',
      'viral': true,
    },
  ];

  final List<Map<String, dynamic>> viralTatliListesi = [
    {
      'ad': 'İnstagram Pasta',
      'tarif':
          'İnstagram pastası veya "Aesthetic Cake", sosyal medyada paylaşılması için tasarlanmış, çok güzel görünen bir pastadır. Katmanlardan oluşan bu pasta, beslenme ve görsel olarak çarpıcı bir kombinasyon sunuyor. Kek tabanları ve farklı renkteki kremleri şeffaf cam bir kapta servis edilir, böylelikle katmanları görünür. Üzerine taze meyveler ve yenilebilir çiçekler konur.',
      'malzemeler': [
        '500 gram şeker',
        '4 adet yumurta',
        '300 gram un',
        '200 ml süt',
        '300 gram tereyağı',
        'Gıda boyası (çeşitli renkler)',
        'Taze meyveler ve çiçekler (dekorasyon)',
      ],
      'hazirlasuresi': '30 mk',
      'pisirmesuresi': '40 mk',
      'zorluk': 'Orta',
      'kisisayisi': '8-10',
      'kalori': '280 kcal',
      'viral': true,
    },
    {
      'ad': 'Viral Çikolata Topları',
      'tarif':
          'Viral çikolata topları, TikTok\'ta 500 milyon görünüşten fazla olan bir tatlıdır. Oreo bisküvi ve cream cheese ile yapılan bu tatlı, çok hızlı ve kolay bir şekilde hazırlanır. Oreo bisküvileri blenderdan geçirilerek toz haline getirilir, cream cheese ile karıştırılır ve top şeklinde biçimlendirilir. Sonra erimiş çikolataya batırılıp donma kabı bırakılır. Çok güzel görünen ve sezilmiş lezzet bir tatlıdır.',
      'malzemeler': [
        '20 adet Oreo bisküvi',
        '200 gram cream cheese',
        '200 gram çikolata (eritilmiş)',
        '1 yemek kaşığı kokonut yağı',
        'Fındık, ceviz, kokus (topping)',
      ],
      'hazirlasuresi': '20 mk',
      'pisirmesuresi': '180 mk (donma)',
      'zorluk': 'Çok Kolay',
      'kisisayisi': '8-10',
      'kalori': '180 kcal',
      'viral': true,
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
