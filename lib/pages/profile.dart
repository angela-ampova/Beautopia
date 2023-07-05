import 'package:flutter/material.dart';

import '../custom_ui_elements/custom_button.dart';


class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Back Button
            Container(
              margin: EdgeInsets.only(left: 10.0, top: 10.0),
              child: IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.teal,
                ),
                onPressed: () {
                  Navigator.pop(context); // Navigate back to the previous screen
                },
              ),
            ),
            // Profile Header
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(vertical: 20.0),
              child: Text(
                'Profile',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.teal,
                ),
              ),
            ),
            // Username and Photo
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(vertical: 20.0),
              child: Column(
                children: [
                  Text(
                    'Chloe225',
                    style: TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 10.0),
                  ClipOval(
                    child: Image.asset(
                      'assets/picture.jpg',
                      width: 80.0,
                      height: 80.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
            // Name Input
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20.0),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Name',
                  labelStyle: TextStyle(color: Colors.teal),
                ),
                style: TextStyle(color: Colors.black),
              ),
            ),
            // Email Input
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Email',
                  labelStyle: TextStyle(color: Colors.teal),
                ),
                style: TextStyle(color: Colors.black),
              ),
            ),
            // Phone Input
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Phone',
                  labelStyle: TextStyle(color: Colors.teal),
                ),
                style: TextStyle(color: Colors.black),
              ),
            ),
            // Password Input
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Password',
                  labelStyle: TextStyle(color: Colors.teal),
                  suffixIcon: Icon(Icons.visibility, color: Colors.teal),
                ),
                style: TextStyle(color: Colors.black),
                obscureText: true,
              ),
            ),
            // Edit Profile Button
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(top: 20.0),
              child: CustomButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/');
                },
                text: 'Edit Profile',
                backgroundColor: Colors.teal,
                textColor: Colors.white,
                padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 30.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
