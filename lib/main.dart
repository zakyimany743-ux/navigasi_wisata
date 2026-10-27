import 'package:flutter/material.dart';

import 'pages/home_page.dart';
import 'pages/pantai_page.dart';
import 'pages/gunung_page.dart';
import 'pages/budaya_page.dart';
import 'pages/kuliner_page.dart';
import 'pages/detail_wisata_page.dart';

/// Titik masuk aplikasi Wisata Indonesia.
///
/// Aplikasi ini mendemonstrasikan konsep routing dan navigasi
/// antarhalaman pada Flutter sesuai materi Bab 7.
void main() {
  runApp(const WisataIndonesiaApp());
}

/// Root widget aplikasi.
///
/// Menggunakan [MaterialApp] dengan [initialRoute] dan [routes]
/// untuk mendefinisikan seluruh halaman aplikasi secara terpusat.
class WisataIndonesiaApp extends StatelessWidget {
  const WisataIndonesiaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wisata Indonesia',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF0EA5E9),
          brightness: Brightness.light,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF0EA5E9),
          foregroundColor: Colors.white,
          centerTitle: true,
          titleTextStyle: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFF0EA5E9),
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
          ),
        ),
        cardTheme: CardThemeData(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),
      // Route pertama yang dimuat saat aplikasi dijalankan.
      initialRoute: '/',
      // Peta nama route ke builder widget.
      routes: {
        '/': (context) => const HomePage(),
        '/pantai': (context) => const PantaiPage(),
        '/gunung': (context) => const GunungPage(),
        '/budaya': (context) => const BudayaPage(),
        '/kuliner': (context) => const KulinerPage(),
        '/detail': (context) => const DetailWisataPage(),
      },
    );
  }
}
