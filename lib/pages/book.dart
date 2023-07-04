import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:beautopia_project/main.dart';

class BookPage extends StatefulWidget {
  @override
  _BookPageState createState() => _BookPageState();
}

class _BookPageState extends State<BookPage> {
  String? _selectedService;
  DateTime? _selectedDate;
  TimeOfDay? _selectedTime;
  String? selectedFilePath; // Define selectedFilePath variable

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
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    hintText: 'Select',
                    hintStyle: TextStyle(color: Colors.black),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
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
              // Date and Time Buttons
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          _selectDate(context); // Open Date Picker
                        },
                        child: Text(
                          'Select Date',
                          style: TextStyle(color: Colors.white),
                        ),
                        style: ElevatedButton.styleFrom(primary: Colors.teal),
                      ),
                    ),
                    SizedBox(width: 10.0),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          _selectTime(context); // Open Time Picker
                        },
                        child: Text(
                          'Select Time',
                          style: TextStyle(color: Colors.white),
                        ),
                        style: ElevatedButton.styleFrom(primary: Colors.teal),
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
                          ? _selectedDate.toString().split(' ')[0] // Show only the date
                          : 'No date selected',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: _selectedDate != null ? Colors.black : Colors.red,
                        fontWeight: _selectedDate != null ? FontWeight.normal : FontWeight.bold,
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
                          ? '${_selectedTime!.hour}:${_selectedTime!.minute}' // Display selected time only
                          : 'No time selected',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: _selectedTime != null ? Colors.black : Colors.red,
                        fontWeight: _selectedTime != null ? FontWeight.normal : FontWeight.bold,
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
                child: ElevatedButton(
                  onPressed: _uploadFile,
                  child: Text(
                    'Upload from device',
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(primary: Colors.teal),
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
                  child: ElevatedButton(
                    onPressed: () {
                      // Perform action on finish button press
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()));
                    },
                    child: Text(
                      'Finish',
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(primary: Colors.teal),
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

  List<String> get _serviceOptions => servicePrices.keys.toList();
}

void main() {
  runApp(MaterialApp(
    home: BookPage(),
  ));
}
