import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';

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

  final questions = const [{
      'questionText' : 'What\'s your favorite color?',
      'answers' : [ 'Blue', 'Red', 'Green', 'Orange']
    },{
      'questionText' : 'What\'s your favorite animal?',
      'answers' : ['Lion', 'Elephant', 'Rabbit']
    },{
      'questionText' : 'What\'s your favorite teacher?',
      'answers' : ['Marcelo', 'Rohit', 'Joseana', 'Hyggo', 'Adalbaerto']
    }];

  var _questionIndex = 0;

    void _answerQuestion(){
      setState(() {
       _questionIndex = _questionIndex + 1; 
      });
       if(_questionIndex < questions.length){
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
      body: _questionIndex < questions.length ?       
         Column(
          children: <Widget>[
            Question(
              questions[_questionIndex]['questionText'],
            ),
            ...(questions[_questionIndex]['answers'] as List<String>).map((answer) {
              return Answer(_answerQuestion, answer);
            }).toList()
          ],
        ) : Center(
          child: Text('You did it!!!'),),
      );
    
  }
}
