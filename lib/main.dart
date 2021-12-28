import 'package:flutter/material.dart';
import 'app_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';


AppBrain appBrain = AppBrain();

void main() {
  runApp(ExamApp());
}

    class ExamApp extends StatelessWidget {    
      @override
      Widget build(BuildContext context) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Scaffold(
            backgroundColor: Colors.grey[300],
          appBar: AppBar(
            backgroundColor: Colors.grey , 
            title: Text("The Exam" ,
            style: TextStyle(
              fontSize: 20,
              color: Colors.red[900]
            ),),
            ),
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: ExamPage(),
            ),
            ), 
          
        );
      }
    }

    class ExamPage extends StatefulWidget {    
      @override
      _ExamPageState createState() => _ExamPageState();      
    }
    
    class _ExamPageState extends State<ExamPage> {
      List<Widget> answerRuselt = [];

      int rightAnswers = 0 ;

      void checkAnswer(bool whatUserPicked) {
         bool correctAnswer = appBrain.getQuestionAnswer();
                setState(() {
           if ( whatUserPicked == correctAnswer ) {
             rightAnswers ++;
           answerRuselt.add(
             Padding(
               padding: const EdgeInsets.all(3.0),
               child: Icon(Icons.thumb_up ,
                color: Colors.green ),
             ),
              );

           } else {
         answerRuselt.add(
             Padding(
               padding: const EdgeInsets.all(3.0),
               child: Icon(Icons.thumb_down ,
                color: Colors.red ),
             ),
              );
       }

       if(appBrain.isFinished() == true ){
             Alert(
      context: context,
      title: "Exam is over!",
      desc: "You answered $rightAnswers out of 7 questions correctly",
      buttons: [
        DialogButton(
          child: Text(
            "Start over",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () => Navigator.pop(context),
          width: 120,
        )
      ],
    ).show();

    appBrain.reset() ; 

    answerRuselt = [] ; 

    rightAnswers = 0 ;
       }else {
       appBrain.nextQuestion();                 

       }    
  });
  }

      @override
      Widget build(BuildContext context) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row( children: answerRuselt,
        ),

            Expanded(
              flex: 5,
               child: Column(
              children: [
              Image.asset(appBrain.getQuestionImage()),
              SizedBox(
                height: 20,
              ),
              Text( appBrain.getQuestionText(),
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
              ),
              ),
            ],)
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: TextButton(
                  style: TextButton.styleFrom(backgroundColor: Colors.indigo),
                  child: Text("True" , 
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),),
                  onPressed: () {
                    checkAnswer(true);
                    },
                    ),
                ),
              ), 
                        Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: TextButton(
                  style: TextButton.styleFrom(backgroundColor: Colors.red),
                  child: Text("False" , 
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),),
                  onPressed: () {
                    checkAnswer(false);
                  },
                ),
                ),
              ), 
          ],
        );
      }
    }