import 'package:bmi_app/const.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  ResultPage({required this.bmi});
  final String bmi;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBGColor,
      appBar: AppBar(
        backgroundColor: kBGColor,
        title: Text("BMI Calculator", style: kBodyTextStyle,),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            SizedBox(height: 60,),
          Column(
            children: [
              Text(
                "Your BMI is",
                style: kResultTextStyle,
              ),
              SizedBox(height: 30,),
              Text(
                bmi,
                style: kBMITextStyle,
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: GestureDetector(
                onTap: (){
                  Navigator.pop(context);
                },
                child: Container(
                  height: 80,
                  color: kBottomContainerColor,
                  child: Center(child:
                  Text(
                    "Back",
                    style: kLargeButtonTextStyle,
                  )
                  ),
                ),
              ),
          ),
        ],
        ),
      ),
    );
  }
}
