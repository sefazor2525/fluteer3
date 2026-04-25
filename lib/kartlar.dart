import 'package:flutter/material.dart';

Widget hizliSecimButonu(
  String ikon,
  String baslik,
  String altBaslik,
  Color renk,
) {
  return Container(
    width: 170,
    padding: const EdgeInsets.all(12),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(15),
      border: Border.all(color: renk.withOpacity(0.5), width: 2),
      boxShadow: [
        BoxShadow(
          color: renk.withOpacity(0.1),
          blurRadius: 8,
          offset: const Offset(0, 4),
        ),
      ],
    ),
    child: Row(
      children: [
        Text(ikon, style: const TextStyle(fontSize: 22)),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                baslik,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                  color: Colors.black87,
                ),
              ),
              Text(
                altBaslik,
                style: const TextStyle(fontSize: 11, color: Colors.grey),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget kucukYatayKart(String resimyolu, String baslik, String kisiSayisi) {
  return Container(
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
    width: 200,
    margin: const EdgeInsets.only(right: 15),
    child: Stack(
      children: [
        ClipRRect(
          child: Image.asset(
            resimyolu,
            height: 100,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
        Container(
          height: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.transparent, Colors.black.withOpacity(0.7)],
            ),
          ),
        ),
        Positioned(
          top: 8,
          left: 8,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: Colors.red.withOpacity(0.8),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              '$kisiSayisi Kişi',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 10,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 8,
          left: 8,
          right: 8,
          child: Row(
            children: [
              Expanded(
                child: Text(
                  baslik,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
              const Text('🔥', style: TextStyle(fontSize: 14)),
            ],
          ),
        ),
      ],
    ),
  );
}
