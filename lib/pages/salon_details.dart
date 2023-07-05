import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../custom_ui_elements/custom_button.dart';
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
            // Salon Logo, Name, and Book Button
            Container(
              alignment: Alignment.center,
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/sashions.png',
                      width: 100.0,
                      height: 100.0,
                    ),
                    SizedBox(width: 20.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Sashions',
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: 10.0),
                        CustomButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => BookPage()),
                            );
                          },
                          text: 'Book',
                          backgroundColor: Colors.teal,
                          padding: EdgeInsets.symmetric(
                            vertical: 10.0,
                            horizontal: 30.0,
                          ),
                          textColor: Colors.white, // Specify the text color
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            // Salon Details
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildDetailRow('Name', 'Sashions'),
                  SizedBox(height: 20.0),
                  _buildDetailRow('Email', 'sashions@gmail.com'),
                  SizedBox(height: 20.0),
                  _buildDetailRow('Working Hours', '9 AM - 6 PM'),
                  SizedBox(height: 20.0),
                  _buildDetailRow('Services', 'Hair Styling, Makeup, Manicure'),
                ],
              ),
            ),
            Spacer(),
            // Open Location in Maps Button
            Container(
              alignment: Alignment.bottomCenter,
              margin: EdgeInsets.only(bottom: 20.0),
              child: CustomButton(
                onPressed: () {
                  _openMap();
                },
                text: 'Open Location in Google Maps',
                backgroundColor: Colors.teal,
                textColor: Colors.white,
                padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
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
