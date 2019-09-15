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

  var _questionIndex = 0;

    void _answerQuestion(){
      setState(() {
       _questionIndex = _questionIndex + 1; 
      });
      print('Anwer Chosen');
      print(_questionIndex);
    }


  @override
  Widget build(BuildContext context) {
    var questions =[
      'What\'s your favorite color?',
      'What\'s your favorite animal?'
    ];
   
    return Scaffold(
      appBar: AppBar(
       
        title: Text(widget.title),
      ),
      body: 
       
         Column(
          children: <Widget>[
            Question(
              questions[_questionIndex],
            ),
            Answer(_answerQuestion),
            Answer(_answerQuestion),
            Answer(_answerQuestion),
            Answer(_answerQuestion),
            Answer(_answerQuestion),
           
            
          ],
        ),
      );
    
  }
}
