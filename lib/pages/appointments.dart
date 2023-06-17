import 'package:flutter/material.dart';

class AppointmentsPage extends StatelessWidget {
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
            // Header
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                'Appointments',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.teal,
                ),
              ),
            ),
            // Current Appointment
            Container(
              margin: EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      'Current',
                      style: TextStyle(
                        color: Colors.teal,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                  SizedBox(height: 10.0),
                  ListTile(
                    leading: CircleAvatar(
                      radius: 30.0,
                      backgroundImage: AssetImage('assets/salon_image.png'),
                    ),
                    title: Text('Beauty Salon 1'),
                    subtitle: Text('Price: 500 MKD'),
                  ),
                ],
              ),
            ),
            // Previous Appointments
            Container(
              margin: EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      'Previous',
                      style: TextStyle(
                        color: Colors.teal,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                  SizedBox(height: 10.0),
                  ListTile(
                    leading: CircleAvatar(
                      radius: 30.0,
                      backgroundImage: AssetImage('assets/salon_image.png'),
                    ),
                    title: Text('Beauty Salon 2'),
                    subtitle: Text('Price: 400 MKD'),
                  ),
                  ListTile(
                    leading: CircleAvatar(
                      radius: 30.0,
                      backgroundImage: AssetImage('assets/salon_image.png'),
                    ),
                    title: Text('Beauty Salon 3'),
                    subtitle: Text('Price: 600 MKD'),
                  ),
                  ListTile(
                    leading: CircleAvatar(
                      radius: 30.0,
                      backgroundImage: AssetImage('assets/salon_image.png'),
                    ),
                    title: Text('Beauty Salon 4'),
                    subtitle: Text('Price: 350 MKD'),
                  ),
                ],
              ),
            ),
            // Logo
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(bottom: 20.0),
              child: Image.asset(
                'assets/logo.png',
                width: 100.0,
                height: 100.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
