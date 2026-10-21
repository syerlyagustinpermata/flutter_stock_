# Flutter Stok Gudang

Aplikasi sederhana untuk mengelola stok barang gudang menggunakan Flutter. Aplikasi ini dibuat sebagai praktikum untuk menerapkan **State dan Interaksi Pengguna**.

## Fitur

- Menampilkan daftar barang dan jumlah stok.
- Memilih barang yang ingin diperbarui.
- Menambah jumlah stok barang.
- Mengurangi jumlah stok barang.
- Menampilkan status stok secara otomatis.
- Memperbarui tampilan ketika stok berubah.

## Teknologi

- Flutter
- Dart
- Material Design

## Konsep yang Digunakan

- `StatefulWidget` untuk tampilan yang dapat berubah.
- `setState()` untuk memperbarui data dan tampilan.
- `DropdownButtonFormField` untuk memilih barang.
- `IconButton` untuk menambah dan mengurangi stok.
- List untuk menyimpan dan menampilkan data barang.

## Cara Menjalankan

1. Pastikan Flutter sudah terpasang.
2. Clone repository ini.
3. Masuk ke folder project.
4. Jalankan perintah berikut:

```bash
flutter pub get
flutter run
```

## Catatan

Data barang masih disimpan sementara di dalam aplikasi. Data akan kembali ke nilai awal ketika aplikasi dijalankan ulang.

## Tujuan

Memahami penggunaan state dan interaksi pengguna melalui aplikasi pengelolaan stok barang sederhana.

