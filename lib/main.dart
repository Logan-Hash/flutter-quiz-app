import 'package:flutter/material.dart';
import './quiz.dart';
import './result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'What\'s your fav color ?',
      'answers': [
        {'text': 'Green', 'score': 10},
        {'text': 'Red', 'score': 3},
        {'text': 'Yellow', 'score': 5}
      ],
    },
    {
      'questionText': 'What\'s your fav animal ?',
      'answers': [
        {'text': 'Snake', 'score': 20},
        {'text': 'Rabbit', 'score': 8},
        {'text': 'Ant', 'score': 10}
      ],
    },
    {
      'questionText': 'What\'s your fav Person ?',
      'answers': [
        {'text': 'John Doe', 'score': 6},
        {'text': 'Jane', 'score': 5},
        {'text': 'John', 'score': 10}
      ],
    },
    {
      'questionText': 'What\'s your fav Food ?',
      'answers': [
        {'text': 'Pizza', 'score': 6},
        {'text': 'Rice', 'score': 5},
        {'text': 'Burger', 'score': 10}
      ],
    },
  ];

  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetHandler() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore += score;
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions)
            : Result(_totalScore, _resetHandler),
      ),
    );
  }
}
