import 'package:flutter/material.dart';
import 'salons_list.dart';
import 'appointments.dart';
import 'profile.dart';

class NavigationMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width * 0.5,
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
                  icon: Icon(Icons.clear, color: Colors.deepOrange),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
            Divider(),
            Center(
              child: Padding(
                padding: EdgeInsets.only(top: 16.0),
                child: ClipOval(
                  child: Image.asset(
                    'assets/picture.jpg',
                    width: 80.0,
                    height: 80.0,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: EdgeInsets.only(top: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
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
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.home, color: Colors.deepOrange),
              title: Row(
                children: [
                  Text('Beauty Salons', style: TextStyle(color: Colors.white)),
                  SizedBox(width: 10),
                  Icon(Icons.arrow_right, color: Colors.white),
                ],
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SalonsListPage()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.calendar_today, color: Colors.deepOrange),
              title: Row(
                children: [
                  Text('Appointments', style: TextStyle(color: Colors.white)),
                  SizedBox(width: 10),
                  Icon(Icons.arrow_right, color: Colors.white),
                ],
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AppointmentsPage()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.person, color: Colors.deepOrange),
              title: Row(
                children: [
                  Text('Profile', style: TextStyle(color: Colors.white)),
                  SizedBox(width: 10),
                  Icon(Icons.arrow_right, color: Colors.white),
                ],
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfilePage()),
                );
              },
            ),
            SizedBox(height: 20.0),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: ListTile(
                  leading: Icon(Icons.logout, color: Colors.deepOrange),
                  title: Text(
                    'Logout',
                    style: TextStyle(color: Colors.white),
                  ),
                  onTap: () {
                    // Perform logout action
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
