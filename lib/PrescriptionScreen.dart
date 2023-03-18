import 'package:flutter/material.dart';

class PrescriptionScreen extends StatelessWidget {
  final String prescription;

  PrescriptionScreen({required this.prescription});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Prescription'),
      ),
      body: Center(
        child: Text(prescription),
      ),
    );
  }
}

void _submitAnswers() async {
  try {
    final response = await http.post(
      Uri.parse('https://your-api-endpoint.com/submit-answers'),
      body: _answers,
    );
    if (response.statusCode == 200) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PrescriptionScreen(prescription: response.body),
        ),
      );
    } else {
      // Handle error
    }
  } catch (e) {
    // Handle error
  }
}

