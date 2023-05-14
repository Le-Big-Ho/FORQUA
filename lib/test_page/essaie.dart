import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Accueil/accueil.dart';


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

class TestOne extends StatefulWidget {
  const TestOne({super.key});

  @override
  State<TestOne> createState() => _TestOneState();
}

class _TestOneState extends State<TestOne> {
  int _correctAnswers = 0;
  int _questionIndex = 0;
  late Timer _timer;
  int _countdown = 30;

  void _startCountdown() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
          (Timer timer) {
        setState(() {
          if (_countdown < 1) {
            Navigator.push(context,
              MaterialPageRoute(builder: (context) => Home()),);
            timer.cancel();
          } else {
            _countdown = _countdown - 1;
          }
        });
      },
    );
  }

  final List<Question> _questions = [
    Question(
      questionText: 'What is the capital of France?',
      answerOptions: ['London', 'Paris', 'Madrid','Barcelone'],
      correctAnswerIndex: 1,
    ),
    Question(
      questionText: 'What is the largest planet in our solar system?',
      answerOptions: ['Mars', 'Venus', 'Jupiter', 'pluton'],
      correctAnswerIndex: 2,
    ),
    Question(
      questionText: 'What is the smallest country in the world?',
      answerOptions: ['Vatican City', 'Monaco', 'Nauru', 'Zanzibarre'],
      correctAnswerIndex: 0,
    ),
  ];

  void _answerQuestion(int selectedAnswerIndex) {
    setState(() {
      if (_questionIndex < _questions.length && _questions[_questionIndex].correctAnswerIndex == selectedAnswerIndex) {
        _correctAnswers++;
      }
      _questionIndex++;

      if (_questionIndex >= _questions.length) {
        _startCountdown();
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
            'Vous avez obtenu $_correctAnswers bonne(s) résonse sur ${_questions.length}.''\nBien tenté'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('Fermer'),
          )
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _startCountdown();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: 300,
          width: 300,
          decoration: BoxDecoration(
              color: Colors.lightBlue,
              borderRadius: BorderRadius.circular(20)
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                decoration: const BoxDecoration(
                  color: Colors.redAccent,
                  borderRadius: BorderRadius.all(Radius.circular(25)),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    '$_countdown',
                    style: const TextStyle(fontSize: 14),
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  _questionIndex < _questions.length
                      ? _questions[_questionIndex].questionText
                      : 'Fin du quiz!',
                  style: GoogleFonts.montserrat(fontSize: 18.5, fontWeight: FontWeight.w800),
                ),
              ),
            SizedBox(height: 20),
                  ..._questionIndex < _questions.length
              ? _questions[_questionIndex].answerOptions
                  .asMap()
                  .entries
                  .map(
                    (entry) => ElevatedButton(
                  onPressed: () => _answerQuestion(entry.key),
                  child: Text(entry.value),
                ),
              )
              : [Center(child: Text('\nMerci pour votre particiaption',
                    style:GoogleFonts.montserrat(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,) ,
                  ))].toList(),
            ],
          ),
        ),
      ),
    );
  }

}
