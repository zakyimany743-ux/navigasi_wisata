# Aplikasi Wisata Indonesia (navigasi_wisata)

Proyek Flutter untuk Tugas Pemrograman Mobile — **Bab 7: Routing dan Navigasi antar Halaman**.

## Fitur Aplikasi

- **Halaman Beranda** dengan 4 menu utama (Pantai, Gunung, Budaya, Kuliner) menggunakan `GridView.count` 2 kolom.
- **4 Halaman Kategori** yang masing-masing menampilkan informasi wisata spesifik:
  - Pantai → Pantai Kuta Bali
  - Gunung → Gunung Rinjani (Lombok)
  - Budaya → Tari Saman (Aceh)
  - Kuliner → Rendang (Sumatera Barat)
- **Halaman Detail Wisata** yang menerima data nama tempat wisata melalui parameter `arguments`.
- **Routing terpusat** menggunakan `MaterialApp` dengan `initialRoute` dan `routes`.
- **Navigasi** dengan `Navigator.pushNamed()` (forward) dan `Navigator.pop()` (back).
- **Passing data** antar halaman via `ModalRoute.of(context)!.settings.arguments`.

## Struktur Proyek

```
navigasi_wisata/
├── lib/
│   ├── main.dart                  # Konfigurasi MaterialApp + routes
│   └── pages/
│       ├── home_page.dart         # Halaman beranda (GridView 4 menu)
│       ├── pantai_page.dart       # Halaman kategori Pantai (Kuta Bali)
│       ├── gunung_page.dart       # Halaman kategori Gunung (Rinjani)
│       ├── budaya_page.dart       # Halaman kategori Budaya (Tari Saman)
│       ├── kuliner_page.dart      # Halaman kategori Kuliner (Rendang)
│       └── detail_wisata_page.dart # Halaman Detail Wisata (penerima data)
├── pubspec.yaml                   # Konfigurasi proyek & dependencies
├── analysis_options.yaml          # Aturan lint
└── README.md                      # Dokumentasi ini
```

## Cara Menjalankan Aplikasi

### Prasyarat

- Flutter SDK 3.5.0 atau lebih baru
- Dart SDK 3.5.0 atau lebih baru
- Editor: Visual Studio Code (direkomendasikan) atau Android Studio
- Emulator atau device fisik (Android/iOS/Web)

### Langkah-Langkah

1. **Clone / salin proyek**

   ```bash
   # Jika menggunakan git
   git clone <repository-url>
   cd navigasi_wisata
   ```

   Atau salin folder `navigasi_wisata` ke direktori lokal Anda.

2. **Install dependencies**

   ```bash
   flutter pub get
   ```

3. **Jalankan aplikasi**

   Pilih salah satu:

   ```bash
   # Web
   flutter run -d chrome

   # Android Emulator
   flutter run -d emulator-5554

   # iOS Simulator (macOS)
   flutter run -d "iPhone 14"

   # Device fisik terhubung
   flutter run
   ```

   Dari VS Code: tekan **F5** atau buka Run > Start Debugging.

4. **Build APK (opsional)**

   ```bash
   flutter build apk --release
   ```

## Cara Membuat Proyek dari Awal (Catatan Pengembangan)

Jika ingin membuat ulang dari nol di VS Code:

1. Buka Command Palette (`Ctrl+Shift+P` / `Cmd+Shift+P`)
2. Pilih **Flutter: New Project**
3. Pilih **Application**
4. Beri nama `navigasi_wisata`
5. Salin file-file dari folder `lib/` pada proyek ini ke folder `lib/` proyek baru Anda.

## Demo Aplikasi

| Beranda | Kategori Pantai | Detail Wisata |
|---------|-----------------|---------------|
| GridView 4 menu | Informasi Kuta Bali | Data diterima via arguments |

Alur navigasi:

```
[Beranda] --tap Pantai--> [Halaman Pantai] --tap Lihat Detail--> [Detail Wisata: "Pantai Kuta Bali"]
        |                                                              |
        |                                                              |--tap Kembali--> [Halaman Pantai]
        |
        |---tap Gunung--> [Halaman Gunung] --tap Lihat Detail--> [Detail Wisata: "Gunung Rinjani"]
        |
        |---tap Budaya--> [Halaman Budaya] --tap Lihat Detail--> [Detail Wisata: "Tari Saman - Aceh"]
        |
        |---tap Kuliner--> [Halaman Kuliner] --tap Lihat Detail--> [Detail Wisata: "Rendang - Sumatera Barat"]
```

## Komponen Utama

| Widget | Fungsi |
|--------|--------|
| `MaterialApp` | Root widget dengan `initialRoute` dan `routes` |
| `Scaffold` | Struktur dasar halaman (AppBar + body) |
| `AppBar` | Header halaman dengan judul |
| `GridView.count` | Menampilkan 4 menu beranda dalam grid 2 kolom |
| `Card` | Kartu informasi yang dapat ditekan |
| `InkWell` | Mendeteksi tap pada kartu menu |
| `Column`, `Row` | Layout vertikal dan horizontal |
| `Container` | Box dekoratif dengan padding, gradient, radius |
| `ElevatedButton.icon` | Tombol "Lihat Detail" untuk navigasi |
| `OutlinedButton.icon` | Tombol "Kembali" |
| `Navigator.pushNamed()` | Buka halaman baru berdasarkan nama route |
| `Navigator.pop()` | Kembali ke halaman sebelumnya |
| `ModalRoute.of(context)` | Mengambil data yang dikirim via `arguments` |

## Mengubah Data Wisata

Data tiap kategori dapat diubah pada file masing-masing:

- Pantai → `lib/pages/pantai_page.dart`
- Gunung → `lib/pages/gunung_page.dart`
- Budaya → `lib/pages/budaya_page.dart`
- Kuliner → `lib/pages/kuliner_page.dart`

Data lengkap untuk halaman Detail disimpan di method `_getDetailWisata()` pada `lib/pages/detail_wisata_page.dart`.

## Lisensi

Bebas digunakan untuk keperluan akademik.
