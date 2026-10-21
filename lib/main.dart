
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Stok Gudang',
      theme: ThemeData(
        colorSchemeSeed: Colors.blue,
        useMaterial3: true,
      ),
      home: const StokPage(),
    );
  }
}

class StokPage extends StatefulWidget {
  const StokPage({super.key});

  @override
  State<StokPage> createState() => _StokPageState();
}

class _StokPageState extends State<StokPage> {
  // State data stok barang
  final List<Map<String, dynamic>> barang = [
    {'nama': 'Kertas A4', 'stok': 20},
    {'nama': 'Pulpen', 'stok': 15},
    {'nama': 'Buku Catatan', 'stok': 10},
  ];

  // State barang yang dipilih
  int barangDipilih = 0;

  void ubahStok(int jumlah) {
    setState(() {
      int stokBaru = barang[barangDipilih]['stok'] + jumlah;

      if (stokBaru >= 0) {
        barang[barangDipilih]['stok'] = stokBaru;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    int stok = barang[barangDipilih]['stok'];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Manajemen Stok Gudang'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),

      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const Text(
            'Data Persediaan Barang',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 6),

          const Text(
            'Kelola stok barang dengan mudah.',
            style: TextStyle(color: Colors.grey),
          ),

          const SizedBox(height: 24),

          const Text(
            'Pilih Barang',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 8),

          DropdownButtonFormField<int>(
            value: barangDipilih,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.inventory_2_outlined),
            ),
            items: List.generate(
              barang.length,
              (index) => DropdownMenuItem(
                value: index,
                child: Text(barang[index]['nama']),
              ),
            ),
            onChanged: (value) {
              setState(() {
                barangDipilih = value!;
              });
            },
          ),

          const SizedBox(height: 20),

          Card(
            elevation: 1,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  const Icon(
                    Icons.inventory,
                    size: 48,
                    color: Colors.blue,
                  ),

                  const SizedBox(height: 12),

                  Text(
                    barang[barangDipilih]['nama'],
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 8),

                  Text(
                    '$stok unit',
                    style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),

                  Text(
                    stok == 0
                        ? 'Stok habis'
                        : stok <= 5
                            ? 'Stok hampir habis'
                            : 'Stok tersedia',
                    style: TextStyle(
                      color: stok == 0
                          ? Colors.red
                          : stok <= 5
                              ? Colors.orange
                              : Colors.green,
                    ),
                  ),

                  const SizedBox(height: 24),

                  const Text('Ubah Jumlah Stok'),

                  const SizedBox(height: 12),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton.filledTonal(
                        onPressed: () => ubahStok(-1),
                        icon: const Icon(Icons.remove),
                      ),

                      const SizedBox(width: 25),

                      const Text(
                        '1 unit',
                        style: TextStyle(fontSize: 16),
                      ),

                      const SizedBox(width: 25),

                      IconButton.filled(
                        onPressed: () => ubahStok(1),
                        icon: const Icon(Icons.add),
                      ),
                    ],
                  ),

                  const SizedBox(height: 8),

                  const Text(
                    'Tekan + untuk menambah stok atau '
                    '- untuk mengurangi stok.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 24),

          const Text(
            'Ringkasan Stok',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 10),

          ...barang.map(
            (item) => Card(
              child: ListTile(
                leading: const Icon(
                  Icons.inventory_2_outlined,
                  color: Colors.blue,
                ),
                title: Text(item['nama']),
                trailing: Text(
                  '${item['stok']} unit',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
