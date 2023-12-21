import 'package:flutter/material.dart';
import 'package:resourseek_app/property/app_color.dart';
import 'package:resourseek_app/supplier/supplierMainPage/supplierHomePage.dart';
import 'package:resourseek_app/supplier/supplierMainPage/supplierOrderPage.dart';
import 'package:resourseek_app/supplier/supplierMainPage/supplierProfilePage.dart';

class SupplierPage extends StatefulWidget {
  const SupplierPage({super.key});

  @override
  State<SupplierPage> createState() => _SupplierPageState();
}

class _SupplierPageState extends State<SupplierPage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    // Add your different pages/screens here
    SupplierHomePage(),
    SupplierOrderPage(),
    SupplierProfilePage()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.primary_blue,
        elevation: 0,
        title: Text("Supplier"),
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Incoming Order',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile'
          ),
        ],
      ),
    );
  }
}

