import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class BookPage extends StatefulWidget {
  @override
  _BookPageState createState() => _BookPageState();
}

class _BookPageState extends State<BookPage> {
  String? _selectedService;
  DateTime? _selectedDate;
  DateTime? _selectedTime;

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
              margin: EdgeInsets.symmetric(vertical: 20.0),
              alignment: Alignment.center,
              child: Text(
                'Book',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.teal,
                ),
              ),
            ),
            // Logo and Name
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 20.0),
                  child: Image.asset(
                    'assets/logo.png',
                    width: 100.0,
                    height: 100.0,
                  ),
                ),
                SizedBox(width: 20.0),
                Text(
                  'Salon Name',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.0),
            // Service Dropdown
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  labelText: 'Service',
                  labelStyle: TextStyle(color: Colors.teal),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.teal),
                  ),
                ),
                value: _selectedService,
                onChanged: _selectService,
                items: _serviceOptions.map((String service) {
                  return DropdownMenuItem<String>(
                    value: service,
                    child: Text(
                      service,
                      style: TextStyle(color: Colors.teal),
                    ),
                  );
                }).toList(),
              ),
            ),
            SizedBox(height: 20.0),
            // Date and Time Pickers
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Date',
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.teal,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  TextButton(
                    onPressed: () {
                      DatePicker.showDatePicker(
                        context,
                        showTitleActions: true,
                        onConfirm: (date) {
                          setState(() {
                            _selectedDate = date;
                          });
                        },
                        currentTime: _selectedDate ?? DateTime.now(),
                        locale: LocaleType.en,
                      );
                    },
                    child: Text(
                      _selectedDate != null
                          ? '${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}'
                          : 'Select Date',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.teal,
                      ),
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    'Time',
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.teal,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  TextButton(
                    onPressed: () {
                      DatePicker.showTimePicker(
                        context,
                        showTitleActions: true,
                        onConfirm: (time) {
                          setState(() {
                            _selectedTime = time;
                          });
                        },
                        currentTime: _selectedTime ?? DateTime.now(),
                        locale: LocaleType.en,
                      );
                    },
                    child: Text(
                      _selectedTime != null
                          ? '${_selectedTime!.hour}:${_selectedTime!.minute}'
                          : 'Select Time',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.teal,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.0),
            // Upload Button
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20.0),
              child: ElevatedButton(
                onPressed: _uploadImage,
                style: ElevatedButton.styleFrom(
                  primary: Colors.teal,
                  onPrimary: Colors.white,
                  padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                child: Text(
                  'Upload',
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20.0),
            // Total Price
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                'Total Price: \$50', // Replace with actual price value
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.teal,
                ),
              ),
            ),
            SizedBox(height: 20.0),
            // Finish Button
            Align(
              alignment: Alignment.bottomRight,
              child: Container(
                margin: EdgeInsets.only(right: 20.0),
                child: ElevatedButton(
                  onPressed: _finishBooking,
                  style: ElevatedButton.styleFrom(
                    primary: Colors.teal,
                    onPrimary: Colors.white,
                    padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  child: Text(
                    'Finish',
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _selectService(String? service) {
    setState(() {
      _selectedService = service;
    });
  }

  void _uploadImage() {
    // Handle image upload
  }

  void _finishBooking() {
    // Handle finish booking
  }
}

final List<String> _serviceOptions = ['Hair', 'Makeup', 'Nails'];