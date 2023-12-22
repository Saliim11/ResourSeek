import 'package:flutter/material.dart';
import 'package:resourseek_app/mainPage/home/checkoutPage.dart';
import 'package:resourseek_app/model/produk.dart';

class DetailProduk extends StatefulWidget {

  const DetailProduk({super.key, required this.produk});

  // final String name, city, price;
  final Produk produk;

  @override
  State<DetailProduk> createState() => _DetailProdukState();
}

class _DetailProdukState extends State<DetailProduk> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail Produk"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 300,
            decoration: BoxDecoration(color: Colors.blue),
            child: Center(
              child: Text("Gambar"),
            ),
          ),
          Padding(
              padding: EdgeInsets.all(8),
              child: Text(
                widget.produk.nama_p,
                style: TextStyle(color: Colors.black, fontSize: 20),
              )),
          Padding(
            padding: EdgeInsets.all(8),
            child: Align(
              alignment: Alignment.centerRight,
              child: Text("${widget.produk.harga}"),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [Text("Deskripsi Data"), Text(widget.produk.deskripsi_p)],
              
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CheckoutPage()));
                  },
                  child: Text("Checkout")),
            ),
          )
        ],
      ),
    );
  }
}
