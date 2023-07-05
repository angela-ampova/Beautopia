import 'package:flutter/material.dart';

class CustomTimePicker extends StatelessWidget {
  final TimeOfDay? selectedTime;
  final Function(TimeOfDay)? onTimeSelected;

  const CustomTimePicker({
    Key? key,
    this.selectedTime,
    this.onTimeSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTimeSelected?.call(selectedTime ?? TimeOfDay.now());
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 16.0),
        decoration: BoxDecoration(
          color: Colors.teal,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Theme(
          data: ThemeData(
            colorScheme: ColorScheme.light(primary: Colors.teal),
            textButtonTheme: TextButtonThemeData(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
              ),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.access_time,
                color: Colors.white,
              ),
              SizedBox(width: 8.0),
              Text(
                'Select Time',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
