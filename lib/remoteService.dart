import 'package:http/http.dart' as http;
import 'package:resourseek_app/model/produk.dart';

class RemoteServices {
  // String host = 'http://localhost:8080';
  Future<List<Produk>?> getAllProduk() async {
    var client = http.Client();

    var uri = Uri.parse('http://localhost:8080/getAllProduk');
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      return postFromJson(json);
    }else {
      return null;
    }
  }
}