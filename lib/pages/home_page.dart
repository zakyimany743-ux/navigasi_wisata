import 'package:flutter/material.dart';

/// Model sederhana untuk item menu beranda.
class MenuWisata {
  final String judul;
  final IconData ikon;
  final Color warna;
  final String route;

  const MenuWisata({
    required this.judul,
    required this.ikon,
    required this.warna,
    required this.route,
  });
}

/// Halaman beranda aplikasi Wisata Indonesia.
///
/// Menampilkan 4 menu utama (Pantai, Gunung, Budaya, Kuliner)
/// menggunakan [GridView.count] dengan 2 kolom.
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  /// Daftar menu yang tampil di beranda.
  static const List<MenuWisata> _menu = [
    MenuWisata(
      judul: 'Pantai',
      ikon: Icons.beach_access,
      warna: Color(0xFF06B6D4),
      route: '/pantai',
    ),
    MenuWisata(
      judul: 'Gunung',
      ikon: Icons.terrain,
      warna: Color(0xFF10B981),
      route: '/gunung',
    ),
    MenuWisata(
      judul: 'Budaya',
      ikon: Icons.theater_comedy,
      warna: Color(0xFFF59E0B),
      route: '/budaya',
    ),
    MenuWisata(
      judul: 'Kuliner',
      ikon: Icons.restaurant,
      warna: Color(0xFFEF4444),
      route: '/kuliner',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(
        title: const Text('Wisata Indonesia'),
      ),
      body: Column(
        children: [
          // Header sambutan
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFF0EA5E9), Color(0xFF0284C7)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Selamat Datang!',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Jelajahi keindahan Indonesia dari sabang sampai merauke.',
                  style: TextStyle(color: Colors.white, fontSize: 14),
                ),
              ],
            ),
          ),

          // Grid menu utama
          Expanded(
            child: GridView.count(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              crossAxisCount: 2,
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              childAspectRatio: 1.0,
              children: _menu.map((item) {
                return _MenuCard(menu: item);
              }).toList(),
            ),
          ),

          // Footer
          const Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              'Pemrograman Mobile - Bab 7',
              style: TextStyle(
                color: Color(0xFF64748B),
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Widget kartu menu individual.
class _MenuCard extends StatelessWidget {
  final MenuWisata menu;

  const _MenuCard({required this.menu});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {
          // Navigasi ke halaman yang dipilih menggunakan route name.
          Navigator.pushNamed(context, menu.route);
        },
        borderRadius: BorderRadius.circular(16),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: LinearGradient(
              colors: [menu.warna, menu.warna.withOpacity(0.7)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                menu.ikon,
                size: 56,
                color: Colors.white,
              ),
              const SizedBox(height: 12),
              Text(
                menu.judul,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'Lihat detail',
                style: TextStyle(
                  color: Colors.white.withOpacity(0.9),
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
