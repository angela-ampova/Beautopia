import 'package:flutter/material.dart';
import 'pages/navigation_menu.dart';

void main() {
  runApp(
    const MaterialApp(
      home: HomePage(),
    ),
  );
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Beauty Salons'),
        backgroundColor: Colors.teal,
      ),
      drawer: NavigationMenu(),
      body: Column(
        children: [
          // Logo
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.all(20.0),
            child: Image.asset(
              'assets/logo.png',
              width: 100.0,
              height: 100.0,
            ),
          ),

          // Beauty Salons List
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(10.0),
              children: [
                SalonCard(
                  name: 'Sashions',
                  description: 'Hair and Makeup',
                ),
                SalonCard(
                  name: 'Sim Saltirova',
                  description: 'Hair',
                ),
                SalonCard(
                  name: 'Nails M',
                  description: 'Nails',
                ),
                SalonCard(
                  name: 'Oktay Seydi',
                  description: 'Hair and Makeup',
                ),
                SalonCard(
                  name: 'Hair House',
                  description: 'Hair',
                ),
                SalonCard(
                  name: 'Studio Metier',
                  description: 'Nails',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SalonCard extends StatelessWidget {
  final String name;
  final String description;

  SalonCard({
    required this.name,
    required this.description,});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 10.0),
      child: ListTile(
        title: Text(name),
        subtitle: Text(description),
        trailing: ElevatedButton(
          onPressed: () {
            // Perform booking action
          },
          style: ElevatedButton.styleFrom(
            primary: Colors.teal, // Change the button background color
            onPrimary: Colors.white, // Change the button text color
          ),
          child: Text('Book'),
        ),
      ),
    );
  }
}