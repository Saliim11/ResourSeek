import 'package:flutter/material.dart';
import 'package:resourseek_app/property/app_color.dart';

class CustomAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColor.primary_blue,
      elevation: 0,
      automaticallyImplyLeading: false, // Hides the back button

      // Content inside the AppBar
      title: Padding(
        padding: const EdgeInsets.only(left: 16.0, top: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Username',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
                color: Colors.white,
              ),
            ),
            IconButton(
              onPressed: () {
                // Add functionality for message button
              },
              icon: Icon(
                Icons.message,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),

      bottom: PreferredSize(
        preferredSize: Size.fromHeight(50.0), // Adjust the height as needed
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8.0)
            ),
            child: TextFormField(
              decoration: InputDecoration(
                hintText: 'Search',
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
        ),
      ),
    );
  }
}