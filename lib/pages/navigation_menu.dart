import 'package:flutter/material.dart';

class NavigationMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width * 0.5, // Set menu width to half of the screen
        decoration: BoxDecoration(
          color: Colors.indigo[900],
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              offset: Offset(0, 2),
              blurRadius: 6.0,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.all(20.0),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 40.0,
                    backgroundImage: AssetImage('assets/profile_picture.png'),
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    'Chloe225',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    'chloe@gmail.com',
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.home, color: Colors.deepOrange),
              title: Text('Beauty Salons', style: TextStyle(color: Colors.white),),
              onTap: () {
                // Navigate to beauty salons page
              },
            ),
            ListTile(
              leading: Icon(Icons.calendar_today, color: Colors.deepOrange),
              title: Text('Appointments', style: TextStyle(color: Colors.white),),
              onTap: () {
                // Navigate to appointments page
              },
            ),
            ListTile(
              leading: Icon(Icons.person, color: Colors.deepOrange),
              title: Text('Profile', style: TextStyle(color: Colors.white),),
              onTap: () {
                // Navigate to profile page
              },
            ),
            Spacer(),
            ListTile(
              leading: Icon(Icons.logout, color: Colors.deepOrange),
              title: Text('Logout', style: TextStyle(color: Colors.white),),
              onTap: () {
                // Perform logout action
              },
            ),
            SizedBox(height: 20.0),
          ],
        ),
      ),
    );
  }
}
