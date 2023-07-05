import 'package:flutter/material.dart';
import '../custom_ui_elements/custom_list.dart';
import 'salon_details.dart';

class SalonsListPage extends StatelessWidget {
  final List<String> salonNames = [
    'Sashions',
    'Sim Saltirova',
    'Nails M',
    'Oktay Seydi',
    'Hair House',
    'Studio Metier',
    'Sashions',
    'Sim Saltirova',
  ];

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
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  'Beauty Salons',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.teal,
                  ),
                ),
              ),
            ),
            // Search Bar
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Row(
                children: [
                  Center(
                    child: Icon(Icons.search),
                  ),
                  SizedBox(width: 10.0),
                  Expanded(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Search salons',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Salons List
            Expanded(
              child: CustomList(
                items: salonNames,
                onTap: (index) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SalonDetailsPage(
                        salonName: salonNames[index],
                        salonImage: '',
                        salonLocation: '',
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
