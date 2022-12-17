import 'package:flutter/material.dart';
import 'answer.dart';
import 'package:quiz_project/pages/questionsPage.dart';

class Question extends StatelessWidget {
  final String questionText;
  final List answers;
  final int index;
  final Function(int index) toNext;

  const Question(
      {super.key,
      required this.questionText,
      required this.answers,
      required this.index,
      required this.toNext});

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle =
        TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: black);
    final emptyBox = SizedBox(
      height: MediaQuery.of(context).size.height / 40,
    );

    double screenHeight = MediaQuery.of(context).size.height,
        screenWidth = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: screenWidth / 20, vertical: screenHeight / 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Question ${index + 1}:', style: textStyle),
          emptyBox,
          Expanded(
              child: Text(questionText,
                  textAlign: TextAlign.center, style: textStyle)),
          emptyBox,
          ...answers.map((value) {
            return Expanded(
                child: Answer(value, () => toNext(answers.indexOf(value))));
          }).toList()
        ],
      ),
    );
  }
}
