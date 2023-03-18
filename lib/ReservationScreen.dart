import 'package:flutter/material.dart';

class ReservationScreen extends StatefulWidget {
  final String hospitalName;

  ReservationScreen(this.hospitalName);

  @override
  _ReservationScreenState createState() => _ReservationScreenState();
}

class _ReservationScreenState extends State<ReservationScreen> {
  late String _selectedDoctor;
  late DateTime _selectedDate;
  late TimeOfDay _selectedTime;

  @override
  void initState() {
    super.initState();
    // Set the initial date and time to the current time
    _selectedDate = DateTime.now();
    _selectedTime = TimeOfDay.now();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Make a Reservation'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hospital: ${widget.hospitalName}',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
            ),
            SizedBox(height: 16.0),
            DropdownButtonFormField(
              decoration: InputDecoration(
                labelText: 'Doctor',
              ),
              value: _selectedDoctor,
              onChanged: (value) {
                setState(() {
                  _selectedDoctor = value!;
                });
              },
              items: [
                DropdownMenuItem(
                  value: 'Dr. John Smith',
                  child: Text('Dr. John Smith'),
                ),
                DropdownMenuItem(
                  value: 'Dr. Jane Doe',
                  child: Text('Dr. Jane Doe'),
                ),
                // Add more doctors here
              ],
            ),
            SizedBox(height: 16.0),
            Text(
              'Date and Time',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
            ),
            SizedBox(height: 16.0),
            InkWell(
              onTap: () {
                _selectDate(context);
              },
              child: Row(
                children: [
                  Icon(Icons.calendar_today),
                  SizedBox(width: 8.0),
                  Text('${_selectedDate.year}-${_selectedDate.month}-${_selectedDate.day}'),
                ],
              ),
            ),
            SizedBox(height: 16.0),
            InkWell(
              onTap: () {
                _selectTime(context);
              },
              child: Row(
                children: [
                  Icon(Icons.access_time),
                  SizedBox(width: 8.0),
                  Text('${_selectedTime.hour}:${_selectedTime.minute}'),
                ],
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton (
              onPressed: () {
                // Confirm the reservation and navigate to the confirmation screen
              },
              child: Text('Confirm Reservation'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _selectedTime,
    );
    if (picked != null && picked != _selectedTime) {
      setState(() {
        _selectedTime = picked;
      });
    }
  }
}
