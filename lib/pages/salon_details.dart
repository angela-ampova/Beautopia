import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'book.dart';

class SalonDetailsPage extends StatelessWidget {
  final String salonName;
  final String salonImage;
  final String salonLocation;

  SalonDetailsPage({
    required this.salonName,
    required this.salonImage,
    required this.salonLocation,
  });



  final TextEditingController _addressController = TextEditingController();

  void _openMap() async {
    String address = _addressController.text;
    String mapUrl = 'https://www.google.com/maps/search/?api=1&query=$address';
    if (await canLaunch(mapUrl)) {
      await launch(mapUrl);
    } else {
      print('Could not launch $mapUrl');
    }
  }

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
            // Salon Details Header
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(vertical: 20.0),
              child: Text(
                'Salon Details',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.teal,
                ),
              ),
            ),
            // Salon Logo and Name
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 20.0, bottom: 10.0),
                  child: Column(
                    children: [
                      Image.asset(
                        salonImage,
                        width: 100.0,
                        height: 100.0,
                      ),
                      SizedBox(height: 10.0),
                      Text(
                        salonName,
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(right: 20.0, bottom: 20.0),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => BookPage()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.teal,
                      padding: EdgeInsets.symmetric(
                        vertical: 10.0,
                        horizontal: 30.0,
                      ),
                    ),
                    child: Text(
                      'Book',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            // Salon Details
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildDetailRow('Name', salonName),
                  SizedBox(height: 20.0),
                  _buildDetailRow('Email', 'salon@example.com'),
                  SizedBox(height: 20.0),
                  _buildDetailRow('Working Hours', '9 AM - 6 PM'),
                  SizedBox(height: 20.0),
                  _buildDetailRow('Services', 'Hair Styling, Manicure'),
                ],
              ),
            ),
            Spacer(),
            // Open Location in Maps Button
            Container(
              alignment: Alignment.bottomCenter,
              margin: EdgeInsets.only(bottom: 20.0),
              child: ElevatedButton(
                onPressed: () {
                  _openMap();
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.teal,
                  onPrimary: Colors.white,
                  padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                child: Text('Open Location in Maps'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            color: Colors.teal,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        SizedBox(height: 10.0),
        Text(
          value,
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
          ),
        ),
      ],
    );
  }
}
