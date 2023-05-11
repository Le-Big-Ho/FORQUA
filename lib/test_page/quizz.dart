import 'package:flutter/material.dart';

class Question {
  final String questionText;
  final List<String> answerOptions;
  final int correctAnswerIndex;

  Question({
    required this.questionText,
    required this.answerOptions,
    required this.correctAnswerIndex,
  });
}

class QuizzScreen extends StatefulWidget {
  const QuizzScreen({Key? key}) : super(key: key);

  @override
  _QuizzScreenState createState() => _QuizzScreenState();
}

class _QuizzScreenState extends State<QuizzScreen> {
  int _correctAnswers = 0;
  int _questionIndex = 0;

  final List<Question> _questions = [
    Question(
      questionText: 'What is the capital of France?',
      answerOptions: ['London', 'Paris', 'Madrid', 'Berlin'],
      correctAnswerIndex: 1,
    ),
    Question(
      questionText: 'What is the largest planet in our solar system?',
      answerOptions: ['Mars', 'Venus', 'Jupiter', 'Mercury'],
      correctAnswerIndex: 2,
    ),
    Question(
      questionText: 'What is the smallest country in the world?',
      answerOptions: ['Vatican City', 'Monaco', 'Nauru', 'Tuvalu'],
      correctAnswerIndex: 0,
    ),
  ];
 
  void _answerQuestion(int selectedAnswerIndex) {
    setState(() {
      if (_questions[_questionIndex].correctAnswerIndex ==
          selectedAnswerIndex) {
        _correctAnswers++;
      }
      _questionIndex++;

      if (_questionIndex >= _questions.length) {
        _showResults();
      }
    });
  }

  void _showResults() {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text('Results'),
        content: Text(
            'vous avez $_correctAnswers repondu a ${_questions.length} questions correctement.'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('Close'),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quizz'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            _questionIndex < _questions.length
                ? _questions[_questionIndex].questionText
                : 'End of quiz!',
            style: TextStyle(fontSize: 24),
          ),
          SizedBox(height: 20),
          ..._questions[_questionIndex].answerOptions
              .asMap()
              .entries
              .map(
                (entry) => ElevatedButton(
              onPressed: _questionIndex < _questions.length
                  ? () => _answerQuestion(entry.key)
                  : null,
              child: Text(entry.value),
            ),
          )
              .toList(),
        ],
      ),
    );
  }

}
