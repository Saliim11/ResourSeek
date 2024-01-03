import 'dart:convert';

List<Produk>  postFromJson(String str) => List<Produk>.from(json.decode(str).map((x) => Produk.fromJson(x)));
String postToJson(List<Produk> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Produk {
  Produk({
    required this.id_produk,
    required this.id_toko,
    required this.nama_p,
    required this.deskripsi_p,
    required this.harga,
    required this.stok,
    this.rating_produk,
    // this.body
  });

  int id_produk;
  int id_toko;
  String nama_p;
  String deskripsi_p;
  double harga;
  int stok;
  double? rating_produk;
  // String? body;

  factory Produk.fromJson(Map<String, dynamic> json) => Produk(
    id_produk: json["id_produk"], 
    id_toko: json["id_toko"], 
    nama_p: json["nama_p"], 
    deskripsi_p: json["deskripsi_p"], 
    harga: json["harga"], 
    stok: json["stok"], 
    rating_produk: json["rating_produk"],
    // body: json["body"]
  );

  Map<String, dynamic> toJson() => {
    // "id_produk": id_produk,
    'id_toko': id_toko,
    'nama_p': nama_p,
    'deskripsi_p': deskripsi_p,
    'harga': harga,
    'stok': stok,
    'rating_produk': rating_produk
  };
  
  // Dummy
}

class ProdukData {
  static List<Produk> produkList = [
    Produk(
      id_produk: 1,
      id_toko: 1,
      nama_p: 'Daging 500 gr',
      deskripsi_p: 'daging Sapi 500 gr segar dari peternakan',
      harga: 80000,
      stok: 50,
      rating_produk: 0,
    ),
    Produk(
      id_produk: 2,
      id_toko: 2,
      nama_p: 'Benang Wol 10 Meter',
      deskripsi_p: 'Benang Wol dari Domba berkualitas',
      harga: 50000,
      stok: 70,
      rating_produk: 0,
    ),
    Produk(
      id_produk: 3,
      id_toko: 3,
      nama_p: 'Kain Sutra 100 Meter',
      deskripsi_p: 'Kain Sutra asli dari puncak',
      harga: 70000,
      stok: 30,
      rating_produk: 0,
    ),
    Produk(
      id_produk: 4,
      id_toko: 1,
      nama_p: 'Ayam 500gr',
      deskripsi_p: 'Ayam kampung 500 gram berkualitas',
      harga: 50000,
      stok: 5,
      rating_produk: 0,
    ),
    Produk(
      id_produk: 5,
      id_toko: 1,
      nama_p: 'Dakron 100gr',
      deskripsi_p: 'Dakron lembut 100 gram',
      harga: 20000,
      stok: 7,
      rating_produk: 0,
    ),
  ];
}