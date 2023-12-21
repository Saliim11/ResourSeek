// ignore: file_names
import 'package:flutter/material.dart';
import 'package:resourseek_app/Appbar/customAppBar.dart';
import 'package:resourseek_app/mainPage/home/cart/cartPage.dart';
import 'package:resourseek_app/mainPage/home/detailProduk.dart';
import 'package:resourseek_app/model/produk.dart';
import 'package:resourseek_app/remoteService.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  // Example list of items
    final List<Map<String, dynamic>> items = List.generate(20, (index) {
    return {
      'name': 'Product $index',
      'city': 'City $index',
      'price': '\$$index',
      'image': "assets/shoppingcart.png",
    };
  });

  List<Produk>? listProduk = [];
  var isLoaded = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  getData() async{
    listProduk = await RemoteServices().getAllProduk();
    if (listProduk != null) {
      setState(() {
        isLoaded = true;
        print(isLoaded);
      });
    }else {
      print("gagal mengambil data produk");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(110.0), // Adjust the height as needed
          child: CustomAppBar(),
        ),
      body: Center(
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 5,
          mainAxisSpacing: 5
          ),
          itemCount: listProduk?.length, 
          // itemCount: items.length,
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) =>DetailProduk(produk: listProduk![index],
                )));
              },
              child: Card(
                elevation: 10,
                child: GridTile(
                          child: Container(
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Center(
                        child: Image.asset(
                          "assets/shoppingcart.png",
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            listProduk![index].nama_p,
                            // items[index]['name'],
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16.0,
                            ),
                          ),
                          SizedBox(height: 4.0),
                          Text(
                            listProduk![index].deskripsi_p,
                            // items[index]['city'],
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: Text(
                          "Rp.${listProduk![index].harga}",
                          // items[index]['price'],
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                          ),
                        ),
              ),
            );
          }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => CartPage()));
        },
        child: const Icon(Icons.shopping_cart),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}