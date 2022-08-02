import 'package:flutter/material.dart';
import 'package:bmi_app/const.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_app/result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: MyHomePage(),
    );
  }
}

enum Gender {
  male, female
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Gender gender = Gender.male;
  var age = 20;
  var height = 140;
  var weight = 35;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBGColor,
      appBar: AppBar(
        backgroundColor: kBGColor,
        title: Text("BMI Calculator", style: kBodyTextStyle,),
      ),
      body: Column(
        children: <Widget>[
          Expanded(child: Row(
            children: <Widget>[
              Expanded(child: GestureDetector(
                onTap: (){
                  setState(() {
                    gender = Gender.male;
                  });
                },
                child: ReusableCard(
                  color: gender == Gender.male ? kActiveCardColor : kInactiveCardColor,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                          FontAwesomeIcons.mars,
                          size: 100
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                          "MALE",
                          style: kBodyTextStyle
                      ),
                    ],
                  ),
                ),
              )),
              Expanded(child: GestureDetector(
                onTap: (){
                  setState(() {
                  gender = Gender.female;
                  });
                },
                child: ReusableCard(
                  color: gender == Gender.female ? kActiveCardColor : kInactiveCardColor,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                          FontAwesomeIcons.venus,
                          size: 100
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                          "FEMALE",
                          style: kBodyTextStyle
                      ),
                    ],
                  ),
                ),
              )),
            ],
          ),
          ),
          Expanded(child: ReusableCard(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  "HEIGHT",
                  style: kBodyTextStyle,
                ),
                Text(
                  height.toString(),
                  style: kNumberTextStyle,
                ),
                Slider(
                  min: 120,
                  max: 228,
                  activeColor: kBottomContainerColor,
                  value: height.toDouble(),
                  onChanged: (value) {
                    setState(() {
                      height = value.round();
                    });
                  },
                ),
              ],
            ),
          )),
          Expanded(child: Row(
            children: <Widget>[
              Expanded(child: ReusableCard(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "WEIGHT",
                      style: kBodyTextStyle,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      weight.toString(),
                      style: kNumberTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RawMaterialButton(
                          onPressed: (){
                            setState(() {
                              weight++;
                            });
                          },
                          child: Icon(FontAwesomeIcons.plus),
                          shape: CircleBorder(),
                          constraints: BoxConstraints.tightFor(
                            width: 51.0,
                            height: 51.0,
                          ),
                          elevation: 10,
                          fillColor: Color(0xFF222747),
                          padding: EdgeInsets.all(5),
                        ),
                        SizedBox(width: 10,),
                        RawMaterialButton(
                          onPressed: (){
                            setState(() {
                              weight--;
                            });
                          },
                          child: Icon(FontAwesomeIcons.minus),
                          shape: CircleBorder(),
                          constraints: BoxConstraints.tightFor(
                            width: 51.0,
                            height: 51.0,
                          ),
                          elevation: 10,
                          fillColor: Color(0xFF222747),
                          padding: EdgeInsets.all(5),
                        ),
                      ],
                    ),
                  ],
                ),
              )),
              Expanded(child: ReusableCard(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "AGE",
                      style: kBodyTextStyle,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      age.toString(),
                      style: kNumberTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RawMaterialButton(
                          onPressed: (){
                            setState(() {
                              age++;
                            });
                          },
                          child: Icon(FontAwesomeIcons.plus),
                          shape: CircleBorder(),
                          constraints: BoxConstraints.tightFor(
                            width: 51.0,
                            height: 51.0,
                          ),
                          elevation: 10,
                          fillColor: Color(0xFF222747),
                          padding: EdgeInsets.all(5),
                        ),
                        SizedBox(width: 10,),
                        RawMaterialButton(
                          onPressed: (){
                            setState(() {
                              age--;
                            });
                          },
                          child: Icon(FontAwesomeIcons.minus),
                          shape: CircleBorder(),
                          constraints: BoxConstraints.tightFor(
                            width: 51.0,
                            height: 51.0,
                          ),
                          elevation: 10,
                          fillColor: Color(0xFF222747),
                          padding: EdgeInsets.all(5),
                        ),
                      ],
                    ),
                  ],
                ),
              )),
              SizedBox(height: 10,),
            ],
          ),),
          GestureDetector(
            onTap: (){
              final heightSquared = height/100;
              final res = weight / (heightSquared * heightSquared);
              Navigator.push(context, MaterialPageRoute(builder: (context) =>
              ResultPage(bmi: res.round().toString(),)));
            },
            child: Container(
              height: 80,
              color: kBottomContainerColor,
              child: Center(child:
              Text(
                "Calculate my BMI",
                style: kLargeButtonTextStyle,
              )
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ReusableCard extends StatelessWidget {
  final Color color;
  final Widget child;

  ReusableCard({
    Key? key,
    this.color = kInactiveCardColor,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
          child: child,
          margin: EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          )
      );
  }
}
