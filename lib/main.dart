import 'package:flutter/material.dart';
import 'quiz_brain.dart';

QuizBrain quizBrain = QuizBrain();

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> scoreKeeper = [];

  void checkAnswer(bool userPickedAnswer) {
    bool correctAnswer = quizBrain.getQuestionAnswer();
    setState(() {
      if (correctAnswer == userPickedAnswer) {
        scoreKeeper.add(Icon(
          Icons.check,
          color: Colors.green,
        ));
        // print('User got it correct!');
      } else {
        // print('User got it wrong!');
        scoreKeeper.add(
          Icon(Icons.close, color: Colors.red),
        );
      }
      quizBrain.nextQuestion();
      // questionNumber++;
    });
  }
  // int questionNumber = 0;

  // List<String> questionsList = [
  //   'You can lead a cow down stairs but not up stairs.',
  //   'Approximately one quarter of human bones are in the feet.',
  //   'A slug\'s blood is green.'
  // ];

  // Question question1 =
  //     Question('You can lead a cow down stairs but not up stairs.', false);
  //
  // Question question2 = Question(
  //     'Approximately one quarter of human bones are in the feet.', true);
  //
  // Question question3 = Question('A slug\'s blood is green.', true);

  // List<bool> answersList = [false, true, true];
  // List<Question> questionBank = [
  //   Question('You can lead a cow down stairs but not up stairs.', false),
  //   Question('Approximately one quarter of human bones are in the feet.', true),
  //   Question('A slug\'s blood is green.', true)
  // ];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                // questionsList[questionNumber],
                quizBrain.getQuestionText(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            // ignore: deprecated_member_use
            child: FlatButton(
              textColor: Colors.white,
              color: Colors.green,
              child: Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                checkAnswer(true);
                //The user picked true.
                // bool correctAnswer = answersList[questionNumber];
                // bool correctAnswer = quizBrain.getQuestionAnswer();
                // // quizBrain.questionBank[questionNumber].questionAnswer;
                // setState(() {
                //   if (correctAnswer == true) {
                //     print('User got it correct!');
                //   } else {
                //     print('User got it wrong!');
                //   }
                //   scoreKeeper.add(Icon(
                //     Icons.check,
                //     color: Colors.green,
                //   ));
                //   quizBrain.nextQuestion();
                //   // questionNumber++;
                // });
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            // ignore: deprecated_member_use
            child: FlatButton(
              color: Colors.red,
              child: Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                checkAnswer(false);
                //The user picked false.
                // bool correctAnswer = answersList[questionNumber];
                // bool correctAnswer = quizBrain.getQuestionAnswer();
                // // quizBrain.questionBank[questionNumber].questionAnswer;
                // setState(() {
                //   if (correctAnswer == false) {
                //     print('User got it correct!');
                //   } else {
                //     print('User got it wrong!');
                //   }
                //   quizBrain.nextQuestion();
                //   // questionNumber++;
                //   scoreKeeper.add(
                //     Icon(
                //       Icons.close,
                //       color: Colors.red,
                //     ),
                //   );
                // });
              },
            ),
          ),
        ),
        Row(
          children: scoreKeeper,
        ),
      ],
    );
  }
}
