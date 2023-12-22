import 'package:flutter/material.dart';

class SupplierOrderPage extends StatefulWidget {
  const SupplierOrderPage({Key? key}) : super(key: key);

  @override
  State<SupplierOrderPage> createState() => _SupplierOrderPageState();
}

class _SupplierOrderPageState extends State<SupplierOrderPage> {
  // Mock data for testing
  final List<ItemModel> mockItems = [
    ItemModel(
      status: 'Tawaran Baru',
      imageUrl: 'assets/shoppingcart.png',
      namaBarang: 'Nama Barang 1',
      tanggal: '2023-01-01',
      harga: 15000.0,
    ),
    ItemModel(
      status: 'Tawaran Baru',
      imageUrl: 'assets/shoppingcart.png',
      namaBarang: 'Nama Barang 2',
      tanggal: '2023-02-01',
      harga: 20000.0,
    ),
    // Add more items as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CustomListView(items: mockItems),
      ),
    );
  }
}

class CustomListView extends StatelessWidget {
  final List<ItemModel> items;

  const CustomListView({Key? key, required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return Card(
          elevation: 2.0,
          margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Status (Tawaran Baru, Diterima, Ditolak, dll.)
                Text(
                  items[index].status,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                  ),
                ),
                SizedBox(height: 8.0),
                // Image Column (Gambar)
                Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Image.asset(
                        items[index].imageUrl,
                        width: 60.0,
                        height: 60.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(width: 16.0),
                    // Title Column (Nama Barang, Tanggal, Harga)
                    Expanded(
                      flex: 7,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(items[index].namaBarang),
                          SizedBox(height: 4.0),
                          Text('Tanggal: ${items[index].tanggal}'),
                          SizedBox(height: 4.0),
                          Text('Harga Tawaran: ${items[index].harga}'),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16.0),
                // Trailing Column (Button Terima, Button Tolak)
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        // Aksi ketika tombol terima ditekan
                      },
                      child: Text('Terima'),
                    ),
                    SizedBox(width: 8.0),
                    ElevatedButton(
                      onPressed: () {
                        // Aksi ketika tombol tolak ditekan
                      },
                      child: Text('Tolak'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class ItemModel {
  final String status;
  final String imageUrl;
  final String namaBarang;
  final String tanggal;
  final double harga;

  ItemModel({
    required this.status,
    required this.imageUrl,
    required this.namaBarang,
    required this.tanggal,
    required this.harga,
  });
}
