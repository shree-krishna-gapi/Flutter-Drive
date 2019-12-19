import 'package:flutter/material.dart';
import 'dart:math';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Dice(),
    );
  }
}
class Dice extends StatefulWidget {
  @override
  _DiceState createState() => _DiceState();
}

class _DiceState extends State<Dice> {
  var leftDiceNumber = Random().nextInt(5);
  var leftDiceNumber2 = Random().nextInt(5);
  @override
  Widget build(BuildContext context) {
    return Scaffold( backgroundColor: Colors.green,
      body: Center(
        child: Row(
          children: <Widget>[
            Expanded(
              child: Padding(padding: EdgeInsets.all(20),
                child: InkWell(
                  onTap: (){
                    setState(() {
                      leftDiceNumber = Random().nextInt(5);
                    });
                  },
                  child: Image.asset('assets/dice$leftDiceNumber.png'),
                ),

              ),
              flex: 1,
            ),

            Expanded(child: Padding(padding: EdgeInsets.all(20),
              child: InkWell(
                child: Image.asset('assets/dice$leftDiceNumber2.png'),
                onTap: (){
                  setState(() {
                    leftDiceNumber2 = Random().nextInt(5);
                  });
                },
              ),
            ),flex: 1,),
          ],
        ),
      ),
    );
  }
}
