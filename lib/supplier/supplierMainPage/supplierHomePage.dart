import 'package:flutter/material.dart';
import 'package:resourseek_app/model/produk.dart';
import 'package:resourseek_app/remoteService.dart';

class SupplierHomePage extends StatefulWidget {
  const SupplierHomePage({super.key});

  @override
  State<SupplierHomePage> createState() => _SupplierHomePageState();
}

class _SupplierHomePageState extends State<SupplierHomePage> {

  List<Produk>? listProduk = [];
  var isLoaded = false;
  int id = 1;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  getData() async{
    listProduk = await RemoteServices().getProdukByToko(id);
    if (listProduk != null) {
      setState(() {
        isLoaded = true;
        print("data sudah berhasil untuk diambil");
      });
    }else {
      print("gagal mengambil data produk");
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          showDialog(context: context, builder: (BuildContext context){
            return CustomDialog();
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class CustomDialog extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController stockController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Add Product'),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: 'Name',
              ),
            ),
            SizedBox(height: 8),
            TextFormField(
              controller: descriptionController,
              decoration: InputDecoration(
                labelText: 'Description',
              ),
            ),
            SizedBox(height: 8),
            TextFormField(
              controller: priceController,
              decoration: InputDecoration(
                labelText: 'Price',
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 8),
            TextFormField(
              controller: stockController,
              decoration: InputDecoration(
                labelText: 'Stock',
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async {
                final newProduk = Produk(
                  // Get data from controllers
                  id_produk: 0, // Assign appropriate ID or handle on server
                  id_toko: 1, // Assign appropriate store ID
                  nama_p: nameController.text,
                  deskripsi_p: descriptionController.text,
                  harga: double.parse(priceController.text),
                  stok: int.parse(stockController.text),
                  rating_produk: 0
                );

                try {
                  await RemoteServices().addProdukList2(newProduk);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Product added successfully')),
                  );
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(e.toString())),
                  );
                }

                // await RemoteServices().addProdukList([newProduk]).then((success) {
                //   if (success) {
                //     // Product added successfully
                //     ScaffoldMessenger.of(context).showSnackBar(
                //       SnackBar(content: Text('Product added successfully')),
                //     );
                //   } else {
                //     // Failed to add product
                //     ScaffoldMessenger.of(context).showSnackBar(
                //       SnackBar(content: Text('Failed to add product')),
                //     );
                //   }
                // });

                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}