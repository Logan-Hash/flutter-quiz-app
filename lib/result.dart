import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function resetHandler;
  Result(this.resultScore, this.resetHandler);

  String get resultPhrase {
    String resultText;
    if (resultScore <= 8) {
      resultText = 'You\'re awesome and innocent !';
    } else if (resultScore <= 15) {
      resultText = 'Pretty likeable!';
    } else if (resultScore <= 20) {
      resultText = 'You\'re ... strange ?';
    } else {
      resultText = 'You are so bad !';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      children: [
        Text(
          resultPhrase,
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        FlatButton(
          onPressed: resetHandler,
          child: Text('Restart Quiz !'),
          textColor: Colors.blue,
        ),
      ],
    ));
  }
}
