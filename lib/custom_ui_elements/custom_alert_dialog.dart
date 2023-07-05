import 'package:flutter/material.dart';

class CustomAlertDialog extends StatelessWidget {
  final String title;
  final String content;
  final VoidCallback onOkPressed;

  const CustomAlertDialog({
    required this.title,
    required this.content,
    required this.onOkPressed,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        title,
        style: TextStyle(
          color: Colors.teal,
        ),
      ),
      content: Text(
        content,
        style: TextStyle(
          color: Colors.black,
        ),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
        side: BorderSide(
          color: Colors.teal,
          width: 2.0,
        ),
      ),
      actions: [
        TextButton(
          child: Text(
            'OK',
            style: TextStyle(
              color: Colors.teal,
              fontWeight: FontWeight.bold,
            ),
          ),
          onPressed: onOkPressed,
        ),
      ],
    );
  }
}
