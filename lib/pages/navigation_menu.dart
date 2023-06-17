import 'package:flutter/material.dart';
import 'salons_list.dart';

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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: Icon(Icons.clear, color: Colors.deepOrange), // Set X icon with deepOrange color
                  onPressed: () {
                    Navigator.pop(context); // Pop the current route and return to the previous page
                  },
                ),
              ],
            ),
            Divider(),
            Padding(
              padding: EdgeInsets.only(left: 16.0, top: 16.0),
              child: CircleAvatar(
                radius: 40.0,
                backgroundImage: AssetImage('assets/profile_picture.png'),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 16.0, top: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'John Doe',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    'johndoe@example.com',
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
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SalonsListPage()), // Navigate to SalonsListPage
                );
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
            ListTile(
              leading: Icon(Icons.logout, color: Colors.deepOrange),
              title: Text(
                'Logout',
                style: TextStyle(color: Colors.white),
              ),
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
