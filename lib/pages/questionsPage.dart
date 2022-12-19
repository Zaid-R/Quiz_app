import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quiz_project/classes/question.dart';
import 'package:quiz_project/data.dart';
import 'package:quiz_project/pages/resultPage.dart';

class QuestionsPage extends StatefulWidget {
  final String name;

  const QuestionsPage(this.name);

  @override
  State<StatefulWidget> createState() => _QuestionsPageState(this.name);
}

Color black = Colors.black, white = Colors.white;

class _QuestionsPageState extends State<QuestionsPage> {
  final String name;

  _QuestionsPageState(this.name);

  int _index = 0;
  bool _isSwitched = false;
  List<int> score = [0];

  void changeTheme(bool isSwitched) {
    setState(() {
      _isSwitched = isSwitched;
      switch (_isSwitched) {
        case false:
          black = Colors.black;
          white = Colors.white;
          break;
        case true:
          white = Colors.black;
          black = Colors.white;
      }
    });
  }

  void toPreviousQuestion() {
    setState(() {
      score.removeAt(--_index + 1);
    });
  }

  void moveToNextQuestion(int AnswerIndex) {
    setState(() {
      score.add(
          score[_index] + (q[_index]['correctIndex'] == AnswerIndex ? 1 : 0));
      _index == q.length - 1
          ? Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (_) => ResultPage(
                      result: score.last,
                      name: this.name,
                      numberOfQuestions: q.length)))
          : ++_index;
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);
    return Scaffold(
        appBar: AppBar(
          leading: _index == 0
              ? null
              : TextButton(
                  onPressed: toPreviousQuestion,
                  child: Text(
                    'Back',
                    style: TextStyle(color: white),
                  ),
                ),
          actions: [
            Center(
                child: Text(
              '${_isSwitched ? 'Dark' : 'Light'} theme',
              style: TextStyle(
                color: black,
                fontSize: 15,
              ),
            )),
            Switch(
                activeColor: white,
                value: _isSwitched,
                onChanged: (value) => changeTheme(value))
          ],
          centerTitle: true,
          title: Text('Quiz App',
              style: TextStyle(shadows: [
                Shadow(color: white, offset: Offset(-2.0, 2.0), blurRadius: 2)
              ], fontSize: 20, fontWeight: FontWeight.bold, color: black)),
        ),
        body: SafeArea(
          child: Container(
              color: white,
              width: double.infinity,
              height: double.infinity,
              child: Question(
                  questionText: q[_index]['question'].toString(),
                  answers: q[_index]['answers'] as List<String>,
                  index: _index,
                  toNext: moveToNextQuestion)),
        ),
      );
  }
}
