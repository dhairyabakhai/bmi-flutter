import 'package:bmi/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'ReusableCard.dart';
import 'finalpage.dart';
import 'calculatorbrain.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData.dark().copyWith(
        primaryColor: kInactiveCardColour,
        accentColor: Colors.blue,
        scaffoldBackgroundColor: Colors.black,
      ),
      home: MyHomePage(),
    );
  }
}
enum Gender {
  Male, 
  Female,
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
   int weight = 50;
    int height = 150;
    int age = 25;
    Gender selectedGender;
  @override
  Widget build(BuildContext context) {
   
    
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget> [
                Expanded(
                   child: GestureDetector(
                     onTap: (){
                       setState(() {
                         selectedGender = Gender.Male;
                       });
                     },
                    child: ReusableCard(
                      colour : selectedGender == Gender.Male ? kActiveCardColour : kInactiveCardColour,
                      cardChild: Column( 
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget> [
                        Icon(FontAwesomeIcons.mars, size: 100.0),
                        Text('MALE', style: kLabelTextStyle),
                      ]
                      ),
                      ),
                   ),
                ),
                Expanded(
                  child:GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedGender = Gender.Female;
                      });
                    },
                     child: ReusableCard(
                      colour : selectedGender == Gender.Female ? kActiveCardColour : kInactiveCardColour,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                         children: <Widget> [
                        Icon(FontAwesomeIcons.venus, size: 100.0),
                        Text('FEMALE', style: kLabelTextStyle)
                      ]
                      ),
                      ),
                  ), ),
              ]
            )
          ),
          Expanded(
            child: 
          ReusableCard (
            colour: kActiveCardColour,
            cardChild: 
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(height.toString() ,style: kNumberTextStyle),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('HEIGHT', style: kLabelTextStyle,),
                    SizedBox(width: 5.0),
                    Text('cm'),
                  ],
                ),
             
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      inactiveTrackColor: Color(0xFF8D8E98),
                      activeTrackColor: Colors.white,
                      thumbColor: Color(0xFF3F5378),
                      overlayColor: Colors.teal,
                      thumbShape:
                          RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape:
                          RoundSliderOverlayShape(overlayRadius: 30.0),
                    ),
                  child: Slider(
                    value: height.toDouble(),
                    min: 120.0,
                    max: 240.0,
                    onChanged:  (double newValue) {
                          setState(() {
                            height = newValue.round();
                          });
                    }
                  ),
                ) 
              ],
            ),
            ),
            ),
          Expanded(
            child: Row(
              children: <Widget>[
            Expanded(
              child: ReusableCard(
                colour: kActiveCardColour,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('WEIGHT', style: kLabelTextStyle,),
                    Text(weight.toString(), style: kNumberTextStyle,), //weight
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                      FloatingActionButton(
                        heroTag: 'btn4',
                        backgroundColor: Colors.grey,
                        child: Icon(FontAwesomeIcons.minus),
                        onPressed: 
                        (){
                          setState(() {
                            weight--;
                          });
                        },),
                        SizedBox(width: 5),
                         FloatingActionButton(
                           heroTag: 'btn3',
                           backgroundColor: Colors.grey,
                        child: Icon(FontAwesomeIcons.plus),
                        onPressed: (){
                          setState(() {
                            weight++;
                          }
                          );
                        },),

                    ],
                    )
              ]
                ),
              ),),
              Expanded(
              child: ReusableCard(
                colour: kActiveCardColour,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('Age', style: kLabelTextStyle,),
                    Text(age.toString(), style: kNumberTextStyle), //age
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                      FloatingActionButton(
                        heroTag: 'btn1',
                        backgroundColor: Colors.grey,
                        child: Icon(FontAwesomeIcons.minus),
                        onPressed: (){
                          setState(() {
                            age--;
                          });
                        },),
                        SizedBox(width: 5.0),
                         FloatingActionButton(
                           heroTag: 'btn2',
                           backgroundColor: Colors.grey,
                        child: Icon(FontAwesomeIcons.plus),
                        onPressed: (){
                          setState(() {
                            
                            age++;
                            
                          });
                        },),
                    ],
                    )
              ]
                ),
              ),)
          ],
          ),
          ),
          GestureDetector(  
            onTap: () {
              Brain calc = Brain(height: height, weight: weight);

            Navigator.push(
            context,
           MaterialPageRoute(builder: (context) => ResultsPage(
             
             resultbmi: calc.calculatebmi(),
             result: calc.result(), 
             interpretation: calc.interpretation(),
           ),
              )
              );
              },      
              child: Container(
                child:
                Center(
                child: Text('Calculate your BMI',style: kLargeButtonTextStyle, textAlign: TextAlign.center,)
              ),
               height: kBottomContainerHeight,
                color: kBottomContainerColour,
                width: double.infinity,
                margin: EdgeInsets.only(top:10.0),
              ), 
          )
      ],
      ),
      );
      
  }
}

