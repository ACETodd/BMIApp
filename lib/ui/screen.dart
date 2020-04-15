import 'package:flutter/material.dart';
import 'dart:math';


class Home extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return new HomeState();
  }
}



class HomeState extends State<Home> {

  final TextEditingController _weightController = new TextEditingController();
  final TextEditingController _heightController = new TextEditingController();
  final TextEditingController _ageController = new TextEditingController();
  double _finalResult = 0.0;
  String status = "";




  void calculate() {
    setState(() {
      _finalResult = _calculateBMI(_weightController.text, _heightController.text, _ageController.text, 703.0);

      if (_finalResult >= 30) {
        status = "overweight";
      } else if (_finalResult >= 25) {
        status = "lil fat";
      } else if (_finalResult >= 18.5) {
        status = "Normal";
      } else
        status = "Underweight";

    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Color.fromRGBO(205, 94, 119, 1),
        title: new Text("BMI App"),
        centerTitle: true,
      ),

      backgroundColor: Color.fromRGBO(244, 194, 194, 1),
      body: new Container(
        alignment: Alignment.topCenter,
        child: new ListView(
          padding: const EdgeInsets.all(2.5),
          children: <Widget>[
            new Image.asset('images/bmilogo.png',
            height: 133.0, width: 200.0,),

            new Container(
              color: Colors.white,
              margin: const EdgeInsets.all(3.0),
                  alignment: Alignment.center,
              child: new Column(
                children: <Widget>[
                  new TextField(
                    controller: _ageController,
                    keyboardType: TextInputType.number,
                    decoration: new InputDecoration(
                      labelText: "Age",  icon: new Icon(Icons.calendar_today)
                    ),
                  ),
                  new TextField(
                    controller: _heightController,
                    keyboardType: TextInputType.number,
                    decoration: new InputDecoration(
                        labelText: "Height in inches", icon: new Icon(Icons.person),
                    ),
                  ),
                  new TextField(
                    controller: _weightController,
                    keyboardType: TextInputType.number,
                    decoration: new InputDecoration(
                        labelText: "Weight in lbs",  icon: new Icon(Icons.linear_scale),
                    ),
                  ),
                  new Padding(padding: new EdgeInsets.all(5.0)),
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      FlatButton(
                        color: Colors.pinkAccent,
                        padding: EdgeInsets.all(8.0) ,
                        onPressed: calculate,
                        child: Text(
                        "Calculate",
                            style: TextStyle(color: Colors.white),
                             ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            new Padding(padding: new EdgeInsets.all(5.0),),
            new Text(
                "$_finalResult",
                    textAlign: TextAlign.center,
                    style: new TextStyle(
                color: Colors.black,
                      fontSize: 20.0,
                        fontWeight: FontWeight.w900,

            )
            ),
            new Padding(padding: new EdgeInsets.all(5.0),),
            new Text(
                "$status",
                textAlign: TextAlign.center,
                style: new TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                  fontWeight: FontWeight.w900,

                )
            ),
          ],
        ),
        ),
      );
  }

  double _calculateBMI(String weight, String height, String age, double d) {
    if (int.parse(weight).toString().isNotEmpty && int.parse(weight) > 0) {
      return (int.parse(weight) * 703 / pow(int.parse(height),2));
    } else {
      print("fail");
      return double.parse("2") * 2;
    }
  }

}



