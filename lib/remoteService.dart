import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:resourseek_app/model/produk.dart';

class RemoteServices {
  String host = 'http://localhost:8080';

  Future<List<Produk>?> getAllProduk() async {
    var client = http.Client();

    var uri = Uri.parse(host+'/getAllProduk');
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      return postFromJson(json);
    }else {
      return null;
    }
  }

  Future<List<Produk>?> getProdukByToko(int id) async {
    var client = http.Client();

    var uri = Uri.parse('http://localhost:8080/getProdukByIdToko/$id');
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      return postFromJson(json);
    }else {
      return null;
    }
  }

  Future<bool> addProdukList(List<Produk> produkList) async {
    var client = http.Client();

    try {
      var uri = Uri.parse('http://localhost:8080/addProduk');
      var response = await client.post(
        uri,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: postToJson(produkList), // Convert the list to JSON
      );

      if (response.statusCode == 201) {
        // Products added successfully
        return true;
      } else {
        // Failed to add products
        return false;
      }
    } catch (e) {
      // Handle any exceptions or errors
      return false;
    } finally {
      client.close(); // Close the client
    }
  }

  Future<Produk> addProdukList2(Produk produk) async{
    final uri = Uri.https("192.172.1.151:8080","addProduk");
    Map<String, dynamic> request = {
      // "id_produk": id_produk,
      'id_toko': produk.id_toko,
    'nama_p': produk.nama_p,
    'deskripsi_p': produk.deskripsi_p,
    'harga': produk.harga,
    'stok': produk.stok,
    'rating_produk': produk.rating_produk
    };
    print("hasil json produk list");
    print(json.encode(request));
    final response = await http.post(uri,
    headers: <String, String>{
      'Access-Control-Allow-Origin': '*',
      'Content-Type': 'application/json; charset=UTF-8',
    }, 
    body: json.encode(request));

    // if (response.statusCode == 200) {
      return Produk.fromJson(json.decode(response.body));
    // }else {
    //   throw Exception('Failed to load post');
    // }
  }

}