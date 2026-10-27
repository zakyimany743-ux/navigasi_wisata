import 'package:flutter/material.dart';

/// Halaman Detail Wisata.
///
/// Halaman ini menerima data berupa nama tempat wisata yang dikirim
/// dari halaman kategori melalui parameter `arguments` pada
/// `Navigator.pushNamed()`. Data diambil menggunakan
/// `ModalRoute.of(context)!.settings.arguments`.
class DetailWisataPage extends StatelessWidget {
  const DetailWisataPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Mengambil data nama wisata yang dikirim dari halaman sebelumnya.
    // Jika tidak ada data, gunakan nilai default 'Tidak Diketahui'.
    final String namaWisata =
        ModalRoute.of(context)?.settings.arguments as String? ?? 'Tidak Diketahui';

    // Peta data detail berdasarkan nama wisata.
    final detail = _getDetailWisata(namaWisata);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Wisata'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Banner dengan nama wisata yang diterima
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: const LinearGradient(
                    colors: [Color(0xFF0EA5E9), Color(0xFF0284C7)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Column(
                  children: [
                    Icon(detail['ikon'] as IconData,
                        size: 72, color: Colors.white),
                    const SizedBox(height: 12),
                    Text(
                      namaWisata,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        'Data diterima dari halaman sebelumnya',
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.95),
                          fontSize: 11,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // Kartu informasi detail
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Informasi Lengkap',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF0F172A),
                        ),
                      ),
                      const SizedBox(height: 16),
                      _buildInfoRow(
                        Icons.location_on,
                        'Lokasi',
                        detail['lokasi'] as String,
                      ),
                      const Divider(height: 24),
                      _buildInfoRow(
                        Icons.star,
                        'Rating',
                        detail['rating'] as String,
                      ),
                      const Divider(height: 24),
                      _buildInfoRow(
                        Icons.attach_money,
                        'Tiket Masuk',
                        detail['tiket'] as String,
                      ),
                      const Divider(height: 24),
                      _buildInfoRow(
                        Icons.access_time,
                        'Jam Operasional',
                        detail['jam'] as String,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Kartu deskripsi panjang
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Deskripsi',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF0EA5E9),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        detail['deskripsi'] as String,
                        style: const TextStyle(
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
              const SizedBox(height: 24),

              // Tombol kembali
              SizedBox(
                width: double.infinity,
                child: OutlinedButton.icon(
                  onPressed: () {
                    // Kembali ke halaman sebelumnya.
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back),
                  label: const Text(
                    'Kembali',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: const Color(0xFF0EA5E9),
                    side: const BorderSide(color: Color(0xFF0EA5E9)),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
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

  /// Widget baris info dengan ikon di sebelah kiri.
  Widget _buildInfoRow(IconData icon, String label, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, color: const Color(0xFF0EA5E9), size: 22),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: const TextStyle(
                  fontSize: 12,
                  color: Color(0xFF64748B),
                ),
              ),
              const SizedBox(height: 2),
              Text(
                value,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF0F172A),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  /// Mengembalikan detail wisata berdasarkan nama yang diterima.
  Map<String, dynamic> _getDetailWisata(String nama) {
    switch (nama) {
      case 'Pantai Kuta Bali':
        return {
          'ikon': Icons.beach_access,
          'lokasi': 'Badung, Bali, Indonesia',
          'rating': '4.7 / 5.0',
          'tiket': 'Rp 5.000 - Rp 10.000',
          'jam': '24 jam',
          'deskripsi':
              'Pantai Kuta terletak di Kabupaten Badung, Bali dan menjadi '
              'destinasi wisata ikonik sejak era 1970-an. Pasir putih '
              'sepanjang 7 km memungkinkan pengunjung berjalan-jalan sore '
              'sekaligus menikmati sunset spektakuler. Pantai ini juga '
              'menyediakan berbagai fasilitas seperti penyewaan papan '
              'selancar, kursi berendam, dan kursus berselancar untuk '
              'pemula. Akomodasi dari hostel hingga resort bintang 5 '
              'mudah ditemui di sekitar kawasan ini.',
        };
      case 'Gunung Rinjani':
        return {
          'ikon': Icons.terrain,
          'lokasi': 'Pulau Lombok, Nusa Tenggara Barat',
          'rating': '4.9 / 5.0',
          'tiket': 'Rp 150.000 (WN) / Rp 5.000 (Loc)',
          'jam': 'Pendakian 2-3 hari',
          'deskripsi':
              'Gunung Rinjani setinggi 3.726 mdpl adalah gunung berapi '
              'tertinggi kedua di Indonesia. Di dalam kawahnya terdapat '
              'Danau Segara Anak yang berbentuk bulan sabit berwarna '
              'biru toska. Para pendaki biasanya memulai perjalanan dari '
              'Sembalun Lawang atau Senaru. Perjalanan menuju puncak '
              'membutuhkan 2-3 hari dengan pemandangan yang memukau '
              'berupa savana, hutan tropis, dan area kawah.',
        };
      case 'Tari Saman - Aceh':
        return {
          'ikon': Icons.theater_comedy,
          'lokasi': 'Dataran Tinggi Gayo, Aceh',
          'rating': '5.0 / 5.0',
          'tiket': 'Gratis (untuk tonton)',
          'jam': 'Sesuai jadwal pertunjukan',
          'deskripsi':
              'Tari Saman adalah tarian tradisional suku Gayo yang '
              'diakui UNESCO sebagai Warisan Budaya Takbenda dunia '
              'pada tahun 2011. Tarian ini dibawakan oleh 10-15 '
              'penari laki-laki yang duduk berdampingan rapat '
              'melakukan gerakan sinkron bertepuk tangan dan memukul '
              'dada. Tarian ini biasanya ditampilkan pada perayaan '
              'hari besar adat dan acara kenegaraan sebagai '
              'representasi kekayaan budaya maritim Aceh.',
        };
      case 'Rendang - Sumatera Barat':
        return {
          'ikon': Icons.restaurant,
          'lokasi': 'Sumatera Barat (Minangkabau)',
          'rating': '5.0 / 5.0',
          'tiket': 'Rp 25.000 - Rp 50.000 / porsi',
          'jam': 'Tersedia setiap hari',
          'deskripsi':
              'Rendang adalah hidangan ikonik Minangkabau yang diakui '
              'CNN International sebagai makanan paling lezat di dunia '
              'tahun 2011. Dibuat dari daging sapi yang dimasak '
              'berjam-jam dengan santan kelapa dan rempah-rempah kaya '
              'akan kunyit, jahe, lengkuas, dan cabai. Tekstur daging '
              'menjadi empuk dengan bumbu yang meresap hingga ke '
              'serat dalam. Rendang biasanya disajikan pada acara '
              'adat, pernikahan, dan perayaan keagamaan.',
        };
      default:
        return {
          'ikon': Icons.place,
          'lokasi': '-',
          'rating': '-',
          'tiket': '-',
          'jam': '-',
          'deskripsi': 'Informasi tidak tersedia.',
        };
    }
  }
}
