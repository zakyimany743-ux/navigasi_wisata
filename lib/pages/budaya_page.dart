import 'package:flutter/material.dart';

/// Halaman kategori Budaya.
///
/// Menampilkan informasi Tari Saman dari Aceh, lengkap dengan
/// deskripsi, asal daerah, dan tombol "Lihat Detail".
class BudayaPage extends StatelessWidget {
  const BudayaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Budaya'),
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
                    colors: [Color(0xFFF59E0B), Color(0xFFD97706)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.theater_comedy, size: 80, color: Colors.white),
                    SizedBox(height: 12),
                    Text(
                      'Warisan Budaya Indonesia',
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
                          const Icon(Icons.theater_comedy,
                              color: Color(0xFFF59E0B)),
                          const SizedBox(width: 8),
                          const Text(
                            'Tari Saman',
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
                          Text('Aceh, Sumatera Utara'),
                        ],
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        'Deskripsi',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFF59E0B),
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'Tari Saman adalah tarian tradisional khas suku Gayo '
                        'di dataran tinggi Gayo, Aceh. Tarian ini dibawakan '
                        'oleh sekelompok penari laki-laki yang duduk berdampingan '
                        'rapat sambil bertepuk tangan, memukul dada, dan '
                        'menggerakkan kepala dengan irama yang sangat sinkron. '
                        'Tari Saman diakui UNESCO sebagai Warisan Budaya Takbenda '
                        'dunia pada tahun 2011 karena keunikan koreografinya '
                        'yang menggabungkan unsur musik, syair, dan gerak.',
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
                      icon: Icons.people,
                      label: 'Jumlah Penari',
                      value: '10 - 15 orang',
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _infoCard(
                      icon: Icons.public,
                      label: 'Pengakuan',
                      value: 'UNESCO 2011',
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
                      arguments: 'Tari Saman - Aceh',
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
            Icon(icon, color: const Color(0xFFF59E0B), size: 28),
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
