import 'package:flutter/material.dart';

class SupplierProfilePage extends StatefulWidget {
  const SupplierProfilePage({super.key});

  @override
  State<SupplierProfilePage> createState() => _SupplierProfilePageState();
}

class _SupplierProfilePageState extends State<SupplierProfilePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Profile Supplier"),
      ),
    );
  }
}