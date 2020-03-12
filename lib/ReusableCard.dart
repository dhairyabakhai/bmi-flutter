import 'package:flutter/material.dart';
import 'constants.dart';


class ReusableCard extends StatelessWidget {
    final Widget cardChild;
    Color colour;
  ReusableCard({this.cardChild, this.colour});
  
  @override
  Widget build(BuildContext context) {
    return Container(
      
      margin: EdgeInsets.all(10.0),
      child: cardChild,
      decoration: BoxDecoration(
        color: colour,
        borderRadius: BorderRadius.circular(20.0)
        
      ),
      
    );
  }
}