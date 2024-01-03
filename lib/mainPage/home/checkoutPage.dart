import 'package:flutter/material.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({Key? key}) : super(key: key);

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  // Variables for total calculation
  int jumlahBarang = 0;
  double tawarHarga = 0.0;
  double total = 0.0;

  // Controller for frekuensi pembelian
  final TextEditingController frekuensiController = TextEditingController();

  // Controller for satuan waktu
  final TextEditingController satuanWaktuController = TextEditingController();

  // Dropdown options for pilihan hari/minggu/bulan
  final List<String> pilihanOptions = ['Hari', 'Minggu', 'Bulan'];
  String selectedPilihan = 'Hari';

  // Controller for harga tawaran
  final TextEditingController hargaTawaranController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Checkout"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Spasi antara gambar dan text field jumlah barang
            SizedBox(height: 16.0),

            // Row untuk Gambar dan Text Field Jumlah Barang
            Row(
              children: [
                // Gambar
                Expanded(
                  flex: 2,
                  child: Image.asset(
                    'assets/shoppingcart.png',
                    width: 100.0, // Sesuaikan ukuran gambar
                    height: 100.0,
                    fit: BoxFit.cover,
                  ),
                ),

                // Spasi antara gambar dan text field
                SizedBox(width: 16.0),

                // Text Field untuk Jumlah Barang
                Expanded(
                  flex: 3,
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'Jumlah Barang',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      setState(() {
                        jumlahBarang = int.tryParse(value) ?? 0;
                        updateTotal();
                      });
                    },
                  ),
                ),
              ],
            ),

            // Spasi antara text field jumlah barang dan text field harga tawaran
            SizedBox(height: 16.0),

            // Text "Harga Barang per Satuan"
            Text(
              'Harga Barang per Satuan',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),

            // Spasi antara teks "Harga Barang per Satuan" dan text field harga tawaran
            SizedBox(height: 8.0),

            // Text Field untuk Harga Tawaran
            Row(children: [
              Text(
                'Rp 15.000',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
            ]),

            // Spasi antara text field harga tawaran dan pembelian selanjutnya
            SizedBox(height: 16.0),

            // Text "Pembelian Selanjutnya"
            Text(
              'Pembelian Selanjutnya',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),

            // Spasi antara teks "Pembelian Selanjutnya" dan text field frekuensi pembelian, satuan waktu, dan pilihan hari/minggu/bulan
            SizedBox(height: 8.0),

            // Row untuk Text Field Frekuensi Pembelian, Satuan Waktu, dan Dropdown Pilihan Hari/Minggu/Bulan
            Row(
              children: [
                // Text Field untuk Frekuensi Pembelian
                Expanded(
                  child: TextField(
                    controller: frekuensiController,
                    decoration: InputDecoration(
                      labelText: 'Berapa kali beli?',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ),

                // Spasi antara text field frekuensi pembelian dan text field satuan waktu
                SizedBox(width: 16.0),

                // Text Field untuk Satuan Waktu
                Expanded(
                  child: TextField(
                    controller: satuanWaktuController,
                    decoration: InputDecoration(
                      labelText: 'Satuan Waktu',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),

                // Spasi antara text field satuan waktu dan dropdown pilihan hari/minggu/bulan
                SizedBox(width: 16.0),

                // Dropdown untuk Pilihan Hari/Minggu/Bulan
                DropdownButton<String>(
                  value: selectedPilihan,
                  onChanged: (value) {
                    setState(() {
                      selectedPilihan = value!;
                    });
                  },
                  items: pilihanOptions.map((option) {
                    return DropdownMenuItem<String>(
                      value: option,
                      child: Text(option),
                    );
                  }).toList(),
                ),
              ],
            ),

            // Spasi antara dropdown pilihan hari/minggu/bulan dan total
            SizedBox(height: 16.0),

            // Text "Total"
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total:',
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
                Text(
                  '$total',
                  style: TextStyle(fontSize: 18.0),
                ),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Tawaran Harga: ',
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
                Text(
                  'Rp ${hargaTawaranController.text}',
                  style: TextStyle(fontSize: 18.0),
                ),
              ],
            ),

            // Spasi antara total dan tombol memasukkan harga tawaran
            SizedBox(height: 16.0),

            // Tombol untuk Memasukkan Harga Tawaran
            Padding(
              padding: EdgeInsets.all(20),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        _showHargaTawaranDialog();
                      },
                      child: Text("Tawar Harga?"),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text("Beli Langsung"),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Function to update total based on jumlahBarang and tawarHarga
  void updateTotal() {
    setState(() {
      total = jumlahBarang * tawarHarga;
    });
  }

  // Function to show AlertDialog for entering harga tawaran
  Future<void> _showHargaTawaranDialog() async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Masukkan Harga Tawaran'),
          content: TextField(
            controller: hargaTawaranController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: 'Harga Tawaran',
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                // You can perform additional actions here when the dialog is dismissed
              },
              child: Text('Batal'),
            ),
            ElevatedButton(
              onPressed: () {
                // Update tawarHarga dan total setelah mengisi harga tawaran
                setState(() {
                  tawarHarga =
                      double.tryParse(hargaTawaranController.text) ?? 0.0;
                  updateTotal();
                });
                Navigator.of(context).pop(); // Tutup dialog
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
