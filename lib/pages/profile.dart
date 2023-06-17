import 'package:flutter/material.dart';

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
                  CircleAvatar(
                    radius: 40.0,
                    backgroundImage: AssetImage('assets/profile_picture.png'),
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
              child: ElevatedButton(
                onPressed: () {
                  // Handle Edit Profile button press
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.teal,
                  padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 30.0),
                ),
                child: Text(
                  'Edit Profile',
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
