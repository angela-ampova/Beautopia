import 'package:flutter/material.dart';

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
    'Nails M',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Column(
        children: [
          // Header
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.all(20.0),
            child: Text(
              'Beauty Salons',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: Colors.teal,
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
                  child: Center(
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
            child: ListView.separated(
              padding: EdgeInsets.all(10.0),
              itemCount: salonNames.length,
              separatorBuilder: (BuildContext context, int index) =>
                  Divider(color: Colors.grey),
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(salonNames[index]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
