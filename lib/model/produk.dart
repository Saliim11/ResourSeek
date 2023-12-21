import 'dart:convert';

List<Produk> postFromJson(String str) => List<Produk>.from(json.decode(str).map((x) => Produk.fromJson(x)));

class Produk {
  Produk({
    required this.id_produk,
    required this.id_toko,
    required this.nama_p,
    required this.deskripsi_p,
    required this.harga,
    required this.stok,
    this.rating_harga,
    this.body
  });

  int id_produk;
  int id_toko;
  String nama_p;
  String deskripsi_p;
  double harga;
  int stok;
  double? rating_harga;
  String? body;

  factory Produk.fromJson(Map<String, dynamic> json) => Produk(
    id_produk: json["id_produk"], 
    id_toko: json["id_toko"], 
    nama_p: json["nama_p"], 
    deskripsi_p: json["deskripsi_p"], 
    harga: json["harga"], 
    stok: json["stok"], 
    rating_harga: json["rating_harga"],
    body: json["body"]
  );

  Map<String, dynamic> toJson() => {
    "id_produk": id_produk,
    "id_toko": id_toko,
    "nama_p": nama_p,
    "deskripsi_p": deskripsi_p,
    "harga": harga,
    "stok": stok,
    "rating_harga": rating_harga,
    "body": body
  };
  
  // Dummy
}