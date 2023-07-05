import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:beautopia_project/main.dart';

import '../custom_ui_elements/custom_alert_dialog.dart';
import '../custom_ui_elements/custom_button.dart';
import '../custom_ui_elements/custom_date_picker.dart';
import '../custom_ui_elements/custom_dropdown.dart';
import '../custom_ui_elements/custom_error_alert_dialog.dart';
import '../custom_ui_elements/custom_time_picker.dart';
import '../data_holder/data_holder.dart';
import '../models/appointment.dart';
import 'package:intl/intl.dart';


class BookPage extends StatefulWidget {
  @override
  _BookPageState createState() => _BookPageState();
}

class _BookPageState extends State<BookPage> {
  String? _selectedService;
  DateTime? _selectedDate;
  TimeOfDay? _selectedTime;
  String? selectedFilePath; // Define selectedFilePath variable
  var data = DataHolder();

  final Map<String, double> servicePrices = {
    'Hair': 1500,
    'Makeup': 2500,
    'Nails': 1000,
  };

  Future<void> _uploadFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.image,
    );
    if (result != null) {
      setState(() {
        selectedFilePath = result.files.single.path!;
      });
    }
  }

  Appointment setAppointment(String type, String date, String time) {
    return Appointment(
      serviceType: type,
      appointmentDate: date,
      appointmentTime: time,
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 500)),
    );
    if (pickedDate != null) {
      setState(() {
        _selectedDate = pickedDate;
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (pickedTime != null) {
      setState(() {
        _selectedTime = pickedTime;
      });
    }
  }


  @override
  void initState() {
    super.initState();
    _selectedService = _serviceOptions[0];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
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
                    Navigator.pop(
                        context); // Navigate back to the previous screen
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
              Container(
                alignment: Alignment.center,
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 20.0),
                        child: Image.asset(
                          'assets/sashions.png',
                          width: 100.0,
                          height: 100.0,
                        ),
                      ),
                      SizedBox(width: 20.0),
                      Text(
                        'Sashions',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              // Select Service Label
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  'Select Service',
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.teal,
                  ),
                ),
              ),
              SizedBox(height: 8.0),
              // Service Dropdown
              CustomDropdown(
                options: _serviceOptions,
                value: _selectedService,
                onChanged: _selectService,
              ),

              SizedBox(height: 20.0),
              // Date and Time Buttons
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  children: [
                    Expanded(
                      child: CustomButton(
                        onPressed: () {
                          _selectDate(context);
                        },
                        text: 'Select Date',
                        backgroundColor: Colors.teal,
                        textColor: Colors.white,
                        padding: EdgeInsets.symmetric(vertical: 16.0),
                      ),
                    ),
                    SizedBox(width: 10.0),
                    Expanded(
                      child: CustomButton(
                        onPressed: () {
                          _selectTime(context);
                        },
                        text: 'Select Time',
                        backgroundColor: Colors.teal,
                        textColor: Colors.white,
                        padding: EdgeInsets.symmetric(vertical: 16.0),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 20.0),
// Selected Date and Time
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Selected Date:',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.teal,
                      ),
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      _selectedDate != null
                          ? DateFormat.yMd().format(_selectedDate!)
                          : 'No date selected',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: _selectedDate != null ? Colors.black : Colors.red,
                        fontWeight:
                        _selectedDate != null ? FontWeight.normal : FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 20.0),
                    Text(
                      'Selected Time:',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.teal,
                      ),
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      _selectedTime != null
                          ? _selectedTime!.format(context)
                          : 'No time selected',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: _selectedTime != null ? Colors.black : Colors.red,
                        fontWeight:
                        _selectedTime != null ? FontWeight.normal : FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 20.0),
              // Select Service Label
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  'Upload Inspiration',
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.teal,
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              // Upload Button
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: CustomButton(
                  onPressed: _uploadFile,
                  text: 'Upload from device',
                  backgroundColor: Colors.teal,
                  textColor: Colors.white,
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                ),
              ),
              SizedBox(height: 20.0),
              // Total Price
              if (_selectedService != null)
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Total Price:',
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.teal,
                        ),
                      ),
                      SizedBox(height: 8.0),
                      Text(
                        '${servicePrices[_selectedService!]} MKD',
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),

              SizedBox(height: 20.0),
              // Finish Button
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: CustomButton(
                    onPressed: () {
                      // Perform action on finish button press
                      _showBookingSuccessDialog(context);
                    },
                    text: 'Finish',
                    backgroundColor: Colors.teal,
                    textColor: Colors.white,
                    padding: EdgeInsets.symmetric(vertical: 16.0),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _selectService(String? service) {
    setState(() {
      _selectedService = service;
    });
  }


  void _handleDateSelected(DateTime? date) {
    setState(() {
      _selectedDate = date;
    });
  }

  void _handleTimeSelected(TimeOfDay? time) {
    setState(() {
      _selectedTime = time;
    });
  }


  List<String> get _serviceOptions => servicePrices.keys.toList();

  void _showBookingSuccessDialog(BuildContext context) {
    if (_selectedService == null || _selectedDate == null ||
        _selectedTime == null) {
      _showErrorDialog(context, 'Please select a service, date, and time.');
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return CustomAlertDialog(
            title: 'Booking Success',
            content: 'You have successfully booked your appointment!',
            onOkPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => HomePage()),
              );
            },
          );
        },
      );
    }
  }

  void _showErrorDialog(BuildContext context, String errorMessage) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return CustomErrorAlertDialog(
          title: 'Error',
          content: errorMessage,
          onOkPressed: () {
            Navigator.pop(context); // Dismiss the error dialog
          },
        );
      },
    );
  }
}


  void main() {
  runApp(MaterialApp(
    home: BookPage(),
  ));
}
