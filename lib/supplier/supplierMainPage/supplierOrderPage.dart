import 'package:flutter/material.dart';

class SupplierOrderPage extends StatefulWidget {
  const SupplierOrderPage({super.key});

  @override
  State<SupplierOrderPage> createState() => _SupplierOrderPageState();
}

class _SupplierOrderPageState extends State<SupplierOrderPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Supplier order income"),
      ),
    );
  }
}