import 'package:flutter/material.dart';
import 'package:quiz_project/pages/questionsPage.dart';

class StartPage extends StatelessWidget {
  StartPage({Key? key}) : super(key: key);

  final nameController = TextEditingController();

  bool autoFocus = false;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height,
        screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
          child: Container(
        color: Colors.green[500],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              color: Colors.green[300],
              padding: EdgeInsets.symmetric(
                  horizontal: screenWidth / 10, vertical: screenHeight / 15),
              margin: EdgeInsets.symmetric(horizontal: screenWidth / 10),
              child: Column(
                children: [
                  TextField(
                    autofocus: autoFocus,
                    controller: nameController,
                    keyboardType: TextInputType.name,
                    style: TextStyle(fontSize: 20),
                    decoration: InputDecoration(
                       contentPadding: EdgeInsets.all(20),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      labelText: "Name:",
                      labelStyle: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                      hintText: 'Enter your name',
                      hintStyle: TextStyle(fontSize: 20),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 12,
                  ),
                  Container(
                      height: screenHeight / 15,
                      width: screenWidth / 2,
                      child: ElevatedButton(
                        onPressed: (){
                          if(nameController.text.length>0)
                         Navigator.pushReplacement(context,MaterialPageRoute(builder: (_)=>QuestionsPage(nameController.text)) );
                        },
                        child: Text(
                          'Start Quiz',
                          style: TextStyle(fontSize: 20),
                        ),
                      ))
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}
