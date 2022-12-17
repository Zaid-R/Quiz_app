import 'package:flutter/material.dart';
import 'package:quiz_project/pages/questionsPage.dart';

class Answer extends StatelessWidget {
  final String answer;
  final Function() fun;

  const Answer(this.answer, this.fun);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 50),
      child: ElevatedButton(
          style: ButtonStyle(
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  side: BorderSide(width: 2, color: black),
                  borderRadius: BorderRadius.circular(100))),
              elevation: MaterialStateProperty.all(0)),
          onPressed: fun,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(answer,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 25, color: white)),
          )),
    );
  }
}
