import 'package:flutter/material.dart';
import 'package:resourseek_app/property/app_color.dart';
import 'package:resourseek_app/supplier/supplierPage.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.primary_blue,
        elevation: 0,
        automaticallyImplyLeading: false, // Hides the back button
        title: Text("Profile"),
      ),
      body: Center(
        child: Container(
          width: 300,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => SupplierPage()));
              }, 
              child: Text("Mode Pedagang")
              ),
              ElevatedButton(onPressed: () {
                
              }, child: Text("Logout"))
            ],
          ),
        ),
      ),
    );
  }
}