import 'package:flutter/material.dart';

/// Halaman kategori Kuliner.
///
/// Menampilkan informasi Rendang dari Sumatera Barat, lengkap
/// dengan deskripsi, asal daerah, dan tombol "Lihat Detail".
class KulinerPage extends StatelessWidget {
  const KulinerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kuliner'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Banner atas
              Container(
                width: double.infinity,
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  gradient: const LinearGradient(
                    colors: [Color(0xFFEF4444), Color(0xFFB91C1C)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.restaurant, size: 80, color: Colors.white),
                    SizedBox(height: 12),
                    Text(
                      'Kelezatan Kuliner Indonesia',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // Kartu informasi utama
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.restaurant,
                              color: Color(0xFFEF4444)),
                          const SizedBox(width: 8),
                          const Text(
                            'Rendang',
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF0F172A),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      const Row(
                        children: [
                          Icon(Icons.location_on, size: 16, color: Colors.grey),
                          SizedBox(width: 4),
                          Text('Sumatera Barat (Minangkabau)'),
                        ],
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        'Deskripsi',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFEF4444),
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'Rendang adalah hidangan tradisional khas Minangkabau '
                        'yang terbuat dari daging sapi yang dimasak dengan '
                        'santan kelapa dan rempah-rempah seperti lengkuas, '
                        'kunyit, jahe, bawang putih, dan cabai. Proses memasak '
                        'rendang memakan waktu berjam-jam hingga santan '
                        'mengering dan menyerap sempurna ke dalam daging. '
                        'CNN International pernah menobatkan rendang sebagai '
                        'makanan paling lezat di dunia nomor 1 pada tahun 2011.',
                        style: TextStyle(
                          fontSize: 14,
                          height: 1.6,
                          color: Color(0xFF334155),
                        ),
                        textAlign: TextAlign.justify,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Kartu info singkat
              Row(
                children: [
                  Expanded(
                    child: _infoCard(
                      icon: Icons.local_fire_department,
                      label: 'Waktu Masak',
                      value: '4 - 8 jam',
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _infoCard(
                      icon: Icons.star,
                      label: 'Peringkat',
                      value: 'No. 1 Dunia (CNN)',
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),

              // Tombol Lihat Detail
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      '/detail',
                      arguments: 'Rendang - Sumatera Barat',
                    );
                  },
                  icon: const Icon(Icons.info_outline),
                  label: const Text(
                    'Lihat Detail',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  Widget _infoCard({
    required IconData icon,
    required String label,
    required String value,
  }) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, color: const Color(0xFFEF4444), size: 28),
            const SizedBox(height: 8),
            Text(
              label,
              style: const TextStyle(
                fontSize: 12,
                color: Color(0xFF64748B),
              ),
            ),
            const SizedBox(height: 4),
            Text(
              value,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Color(0xFF0F172A),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
