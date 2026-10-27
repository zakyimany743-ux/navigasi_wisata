import 'package:flutter/material.dart';

/// Halaman kategori Gunung.
///
/// Menampilkan informasi Gunung Rinjani lengkap dengan
/// deskripsi, lokasi, dan tombol "Lihat Detail".
class GunungPage extends StatelessWidget {
  const GunungPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gunung'),
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
                    colors: [Color(0xFF10B981), Color(0xFF047857)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.terrain, size: 80, color: Colors.white),
                    SizedBox(height: 12),
                    Text(
                      'Keagungan Pegunungan Indonesia',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
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
                          const Icon(Icons.terrain, color: Color(0xFF10B981)),
                          const SizedBox(width: 8),
                          const Text(
                            'Gunung Rinjani',
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
                          Text('Pulau Lombok, Nusa Tenggara Barat'),
                        ],
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        'Deskripsi',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF10B981),
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'Gunung Rinjani merupakan gunung berapi tertinggi kedua '
                        'di Indonesia dengan ketinggian 3.726 meter di atas '
                        'permukaan laut, terletak di Pulau Lombok, Nusa Tenggara '
                        'Barat. Di dalam kawahnya terdapat Danau Segara Anak '
                        'berwarna biru toska yang menjadi daya tarik utama para '
                        'pendaki. Rinjani juga menjadi bagian dari Taman Nasional '
                        'Gunung Rinjani yang kaya akan flora dan fauna endemik '
                        'seperti burung jalak putih dan monyet hitam.',
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
                      icon: Icons.height,
                      label: 'Ketinggian',
                      value: '3.726 mdpl',
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _infoCard(
                      icon: Icons.hiking,
                      label: 'Tingkat Kesulitan',
                      value: 'Menengah',
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
                      arguments: 'Gunung Rinjani',
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
            Icon(icon, color: const Color(0xFF10B981), size: 28),
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
