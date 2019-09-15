import 'package:flutter/material.dart';
import './quiz.dart';
import './result.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: MyHomePage(title: 'Quiz Aplication'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final _questions = const [{
      'questionText' : 'What\'s your favorite color?',
      'answers' : [ 
        {'text': 'Blue', 'score': 5},  
        {'text': 'Green', 'score': 15},  
        {'text': 'Red', 'score': 9},  
        {'text': 'Orange', 'score': 10}]
    },{
      'questionText' : 'What\'s your favorite animal?',
      'answers' : [
        {'text': 'Lion', 'score': 9},
        {'text': 'Cat', 'score': 6},
        {'text': 'Bear', 'score': 5},
        {'text': 'Dog', 'score': 15},
        {'text': 'Rabbit', 'score': 6},
      ]
    },{
      'questionText' : 'What\'s your favorite teacher?',
      'answers' : [
        {'text': 'Marcelo Barros', 'score': -100},
        {'text': 'Rohit', 'score': 10},
        {'text': 'Hyggo', 'score': 15},
      ]
    }];

  var _questionIndex = 0;
  var _totalscore =0;

  void _resetQuiz(){
    setState(() {
      _questionIndex = 0;
      _totalscore = 0;  
    });
  }

  void _answerQuestion(int score){
    _totalscore = _totalscore +score;
    setState(() {
     _questionIndex = _questionIndex + 1; 
    });
    if(_questionIndex < _questions.length){
      print('We have more quastions');
    }else{
      print('We don\'t have more questions');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       
        title: Text(widget.title),
      ),
      body: _questionIndex < _questions.length ?       
        Quiz(
          answerQuestion: _answerQuestion, 
          questionIndex: _questionIndex, 
          questions: _questions,
          )
        : Result(_totalscore, _resetQuiz)
      );
    
  }
}
