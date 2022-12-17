import 'package:flutter/material.dart';
import 'package:quiz_project/pages/questionsPage.dart';

class ResultPage extends StatelessWidget {
  final int result;
  final String name;
  final int numberOfQuestions;

  const ResultPage(
      {super.key,
      required this.result,
      required this.name,
      required this.numberOfQuestions});

  @override
  Widget build(BuildContext context) {
    final emptyBox = SizedBox(height: MediaQuery.of(context).size.height / 12);
    final resultTextStyle = TextStyle(fontSize: 30, color: Colors.black,fontWeight: FontWeight.bold);
    return Scaffold(
        body: SafeArea(
      child: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.green[300],
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              (result > (numberOfQuestions / 2).floor()
                      ? 'Congrats '
                      : 'Oops, good luck next time ') +
                  name,
              style: resultTextStyle,textAlign: TextAlign.center,
            ),
            emptyBox,
            Text('Grade : ${result}\/${numberOfQuestions}',
                style: resultTextStyle),
            emptyBox,
            ElevatedButton(
              onPressed: () => Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (_) => QuestionsPage(this.name))),
              child:  Text('Resart quiz'),
              style: ButtonStyle(
                  shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20))),
                  elevation: MaterialStateProperty.all(0)),
            )
          ],
        ),
      ),
    ));
  }
}
