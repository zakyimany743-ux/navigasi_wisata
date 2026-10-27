import 'package:flutter/material.dart';

/// Halaman kategori Pantai.
///
/// Menampilkan informasi Pantai Kuta Bali lengkap dengan
/// deskripsi, lokasi, dan tombol "Lihat Detail" yang membawa
/// pengguna ke halaman [DetailWisataPage] dengan mengirimkan
/// data nama tempat wisata.
class PantaiPage extends StatelessWidget {
  const PantaiPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pantai'),
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
                    colors: [Color(0xFF06B6D4), Color(0xFF0EA5E9)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.beach_access, size: 80, color: Colors.white),
                    SizedBox(height: 12),
                    Text(
                      'Keindahan Pantai Indonesia',
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
                          const Icon(Icons.place, color: Color(0xFF06B6D4)),
                          const SizedBox(width: 8),
                          const Text(
                            'Pantai Kuta Bali',
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
                          Text('Badung, Bali, Indonesia'),
                        ],
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        'Deskripsi',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF0EA5E9),
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'Pantai Kuta adalah salah satu pantai paling terkenal di '
                        'Indonesia, terletak di daerah Badung, Bali. Pantai ini '
                        'memiliki pasir putih yang lembut sepanjang kurang lebih '
                        '7 kilometer dengan ombak yang konsisten sehingga '
                        'menjadi surga bagi para peselancar. Selain berselancar, '
                        'pengunjung juga dapat menikmati pemandangan matahari '
                        'terbenam yang spektakuler yang menjadi ikon pariwisata '
                        'Bali sejak era 1970-an.',
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
                      icon: Icons.waves,
                      label: 'Ombak',
                      value: 'Sedang - Besar',
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _infoCard(
                      icon: Icons.access_time,
                      label: 'Waktu Terbaik',
                      value: 'Sore Hari',
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
                    // Mengirim data berupa nama tempat wisata ke halaman Detail.
                    Navigator.pushNamed(
                      context,
                      '/detail',
                      arguments: 'Pantai Kuta Bali',
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
            Icon(icon, color: const Color(0xFF06B6D4), size: 28),
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
