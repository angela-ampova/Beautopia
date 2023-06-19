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
                        fontSize: 15,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                  SizedBox(height: 10.0),
                  ListTile(
                    leading: CircleAvatar(
                      radius: 30.0,
                      backgroundImage: AssetImage('assets/sashions.png'),
                    ),
                    title: Text('Sashions'),
                    subtitle: Text('2500 MKD'),
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
                        fontSize: 15,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                  SizedBox(height: 10.0),
                  ListTile(
                    leading: CircleAvatar(
                      radius: 30.0,
                      backgroundImage: AssetImage('assets/delovska.jpg'),
                    ),
                    title: Text('Studio Delovska'),
                    subtitle: Text('2000 MKD'),
                  ),
                  ListTile(
                    leading: CircleAvatar(
                      radius: 30.0,
                      backgroundImage: AssetImage('assets/segreto.jpg'),
                    ),
                    title: Text('Segreto'),
                    subtitle: Text('1500 MKD'),
                  ),
                  ListTile(
                    leading: CircleAvatar(
                      radius: 30.0,
                      backgroundImage: AssetImage('assets/dlart.jpg'),
                    ),
                    title: Text('DL Art'),
                    subtitle: Text('3000 MKD'),
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
