import 'package:flutter/material.dart';
import 'constants.dart';

class ResultsPage extends StatelessWidget {
  String resultbmi;
  String interpretation;
  String result;

  ResultsPage({this.resultbmi, this.interpretation, this.result});


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body:
      Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        
        children: <Widget> [
        Expanded( 
          child: Container(
          child: 
          Text('Your Result', style: kTitleTextStyle ),
          ),
        ),
        Expanded(
          flex: 5,
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
              Text(result.toUpperCase(), style: kResultTextStyle),
              Text(resultbmi, style: kBMITextStyle ),
              Text(interpretation, 
              textAlign: TextAlign.center, 
              style: kBodyTextStyle,)
            ],
            )
          ,) 
          ,),
          GestureDetector(  
            onTap: () {
             Navigator.pop(context);
                },
              child: Container(
                child:
                Center(
                child: Text('RE-CALCULATE',style: kLargeButtonTextStyle, textAlign: TextAlign.center,)
              ),
               height: kBottomContainerHeight,
                color: kBottomContainerColour,
                width: double.infinity,
                margin: EdgeInsets.only(top:10.0),
              ), 
          )
      ]
      )
       
      );
     
  }
}