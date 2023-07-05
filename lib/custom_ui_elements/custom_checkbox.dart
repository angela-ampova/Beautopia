import 'package:flutter/material.dart';

class CustomCheckbox extends StatelessWidget {
  final bool value;
  final Function(bool) onChanged;

  const CustomCheckbox({
    required this.value,
    required this.onChanged,
    required Color activeColor,
    required Color checkColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 24.0,
      width: 24.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: Colors.teal,
          width: 2.0,
        ),
      ),
      child: InkWell(
        onTap: () {
          onChanged(!value);
        },
        borderRadius: BorderRadius.circular(12.0),
        child: Padding(
          padding: EdgeInsets.all(2.0),
          child: value
              ? Icon(
            Icons.check,
            size: 16.0,
            color: Colors.teal,
          )
              : Container(),
        ),
      ),
    );
  }
}
