import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final  Function resetHandle;

  Result(this.resultScore, this.resetHandle);

  String get resultPhrase {
    String resultText;
    if(resultScore <= -10){
      resultText = 'Marcelo Really ?????? You are crazy man!!!!! I respect you';
    } else if( resultScore <= 30){
      resultText = 'You did it';
    } else{
      resultText = 'Ok, it\'s strange, How you know the answers?';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
          margin: EdgeInsets.all(50 ),
          width: double.infinity,
        
          
          child: Column(
            
            children: <Widget>[
              Text(
                resultPhrase,
                style: TextStyle(
                fontSize: 36, 
                fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              FlatButton(
                child: Text('Restart Quiz'),
                onPressed: resetHandle,
                textColor: Colors.orange,
              ),
            ]),
          );
  }
}

  
