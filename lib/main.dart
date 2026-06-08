import 'package:flutter/material.dart';
import 'package:tasarim_calismasi/l10n/app_localizations.dart';
import 'package:tasarim_calismasi/anasayfa.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Design Study',
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: const Locale('tr', 'TR'), // Varsayılan dil: Türkçe
      home: const Anasayfa(),
    );
  }
}
