import 'package:flutter/material.dart';
import '../custom_ui_elements/custom_button.dart';
import '../pages/book.dart';

class SalonCard extends StatelessWidget {
  final String name;
  final String description;

  SalonCard({
    required this.name,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 10.0),
      child: ListTile(
        title: Text(name),
        subtitle: Text(description),
        trailing: CustomButton(
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
          textColor: Colors.white,
        ),
      ),
    );
  }
}
