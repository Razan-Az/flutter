import 'package:flutter/material.dart';


class QuestionnaireScreen extends StatefulWidget {
  final Doctor doctor;
  
  QuestionnaireScreen({required this.doctor});
  
  @override
  _QuestionnaireScreenState createState() => _QuestionnaireScreenState();
}

class _QuestionnaireScreenState extends State<QuestionnaireScreen> {
  final _formKey = GlobalKey<FormState>();
  final _answers = <String, String>{};
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Questionnaire'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Please answer the following questions:',
                  style: TextStyle(fontSize: 16.0),
                ),
                SizedBox(height: 16.0),
                ...widget.doctor.questions.map((question) => buildQuestionWidget(question)).toList(),
                SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      _submitAnswers();
                    }
                  },
                  child: Text('Submit'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  
  Widget buildQuestionWidget(Question question) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          question.question,
          style: TextStyle(fontSize: 16.0),
        ),
        SizedBox(height: 8.0),
        TextFormField(
          onSaved: (value) {
            _answers[question.id] = value!;
          },
          validator: (value) {
            if (value!.isEmpty) {
              return 'Please answer this question';
            }
            return null;
          },
        ),
      ],
    );
  }
  
  void _submitAnswers() {
    // TODO: Submit answers to the server and navigate to the prescription screen
  }
}
