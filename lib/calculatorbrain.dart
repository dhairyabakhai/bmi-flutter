import 'dart:math';

class Brain {
 
  
  Brain({this.height, this.weight});
   final int height;
  final int weight;

  double _bmi;

  String calculatebmi () {
    _bmi = weight / pow(height/100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String result () {
    if (_bmi >= 25.0 ) {return 'Overweight'; } 
    else if (_bmi > 18.0 ) {  return 'Normal';}
    else { return  'Underweight'; } 
  }

  String interpretation () {
     if (_bmi >= 25.0 ) {return 'Exercise more';}
    else if (_bmi > 18.0 ) {return 'Excellent!';}
    else {return 'Eat more and Eat Healthy';}
  }
}