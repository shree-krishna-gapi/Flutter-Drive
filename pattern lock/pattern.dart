import 'package:flutter/material.dart';
class Palatte {
  static const Color wtext = Colors.white;
  static const Color ptrnColor = Colors.black26;
  static const Color yellow1 = Colors.amber;
  static const Color color2 = Colors.purple;
}

class Pattern extends StatefulWidget {
  @override
  _PatternState createState() => _PatternState();
}

class _PatternState extends State<Pattern> {
  @override
  bool showPin = true;
  String astric = '';
  int counter = 0;
  String pin="";
  getKeyValue(n) async {
    if(n == 10) {
      setState(() {
        if (counter != 0){counter--;}
      });
    }
    else {
      setState(() {counter++;});
    }
    pin=pin+n.toString();

    switch(counter) {
      case 0:
        astric = '';
        break;
      case 1:
        astric = '*';
        break;
      case 2:
        astric = '**';
        break;
      case 3:
        astric = '***';
        break;
      case 4:
        counter = 0;
        astric = '';

        setState(() {
          showPin = true;
        });
        int y = 1212;
        if(pin == y.toString()) {
          _showDialog(
              'Login Success',
              ''
          );
        }
        else {
          _showDialog(
              'Invalid Pin!',
              'Users, have must be valid pin, Thank You.'
          );
        }
        pin ="";
    }



  }
  _showDialog(title, text) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(title,style: TextStyle(color: Colors.red[300],fontSize: 22,fontFamily: 'Ubuntu',fontWeight: FontWeight.w400),),
            content: Text(text,style: TextStyle(color: Colors.black54,fontSize: 16,fontFamily: 'Ubuntu', fontWeight: FontWeight.w400),),
            actions: <Widget>[
              FlatButton(
                child: Text('Ok',style: TextStyle(color: Colors.blue[700],fontSize: 16,fontFamily: 'Ubuntu', fontWeight: FontWeight.w400)),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        }
    );
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top:30.0),
      height: 600,
      color: Colors.black12,
      child: Stack(
        children: <Widget>[
          Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[

                SizedBox(height: 20),
                Container(
                  height: 30,
                  child:  astric == '' ? Align(child: Text('Enter Your Pin',
                      style: TextStyle(fontSize: 16,color: Palatte.wtext)),) : Align(child: Text(astric,style:
                  TextStyle(
                      fontSize: 22,color: Palatte.wtext,
                  ),),),
                ),


                Padding(padding: EdgeInsets.fromLTRB(85, 5, 85, 0),
                  child: SizedBox( height: 1, child: Container(color: Colors.amber,)),
                ),




                Padding(
                  padding: EdgeInsets.fromLTRB(
                      70, 20, 70, 20),
                  child: showPin ?
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Container(
                            child: ClipOval(
                              child: Container(
                                width: 52.0, height: 52.0,
                                decoration: BoxDecoration(
                                  borderRadius: new BorderRadius.circular(
                                      25.0),
                                ),
                                child: Material(
                                  color: Palatte.ptrnColor,
                                  child: InkWell(
                                    onTap: () {
                                      getKeyValue(1);
                                    },
                                    child: Align(
                                        child: Text(
                                            '1',style: TextStyle(color:Colors.white))),
                                    splashColor: Palatte.yellow1,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            child: ClipOval(
                              child: Container(
                                width: 52.0, height: 52.0,
                                decoration: BoxDecoration(
                                  borderRadius: new BorderRadius.circular(
                                      25.0),
                                ),
                                child: Material(
                                  color: Palatte.ptrnColor,
                                  child: InkWell(
                                    onTap: () {
                                      getKeyValue(2);
                                    },
                                    child: Align(
                                      child: Text(
                                          '2',style: TextStyle(color:Colors.white)),),
                                    splashColor: Palatte.yellow1,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            child: ClipOval(
                              child: Container(
                                width: 52.0, height: 52.0,
                                decoration: BoxDecoration(
                                  borderRadius: new BorderRadius.circular(
                                      25.0),
                                ),
                                child: Material(
                                  color: Palatte.ptrnColor,
                                  child: InkWell(
                                    onTap: () { getKeyValue(3);},
                                    child: Align(
                                      child: Text('3',style: TextStyle(color:Colors.white)),),
                                    splashColor: Palatte.yellow1,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Container(
                            child: ClipOval(
                              child: Container(
                                width: 52.0, height: 52.0,
                                decoration: BoxDecoration(
                                  borderRadius: new BorderRadius.circular(
                                      25.0),
                                ),
                                child: Material(
                                  color: Palatte.ptrnColor,
                                  child: InkWell(
                                      onTap: () { getKeyValue(4);},
                                      child: Align(
                                        child: Text('4',style: TextStyle(color:Colors.white)),),
                                      splashColor: Palatte.yellow1
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            child: ClipOval(
                              child: Container(
                                width: 52.0, height: 52.0,
                                decoration: BoxDecoration(
                                  borderRadius: new BorderRadius.circular(
                                      25.0),
                                ),
                                child: Material(
                                  color: Palatte.ptrnColor,
                                  child: InkWell(
                                      onTap: () { getKeyValue(5);},
                                      child: Align(
                                        child: Text('5',style: TextStyle(color:Colors.white)),),
                                      splashColor: Palatte.yellow1
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            child: ClipOval(
                              child: Container(
                                width: 52.0, height: 52.0,
                                decoration: BoxDecoration(
                                  borderRadius: new BorderRadius.circular(
                                      25.0),
                                ),
                                child: Material(
                                  color: Palatte.ptrnColor,
                                  child: InkWell(
                                      onTap: () { getKeyValue(6);},
                                      child: Align(
                                        child: Text('6',style: TextStyle(color:Colors.white)),),
                                      splashColor: Palatte.yellow1
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Container(
                            child: ClipOval(
                              child: Container(
                                width: 52.0, height: 52.0,
                                decoration: BoxDecoration(
                                  borderRadius: new BorderRadius.circular(
                                      25.0),
                                ),
                                child: Material(
                                  color: Palatte.ptrnColor,
                                  child: InkWell(
                                      onTap: () { getKeyValue(7);},
                                      child: Align(
                                        child: Text('7',style: TextStyle(color:Colors.white)),),
                                      splashColor: Palatte.yellow1
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            child: ClipOval(
                              child: Container(
                                width: 52.0, height: 52.0,
                                decoration: BoxDecoration(
                                  borderRadius: new BorderRadius.circular(
                                      25.0),
                                ),
                                child: Material(
                                  color: Palatte.ptrnColor,
                                  child: InkWell(
                                    onTap: () { getKeyValue(8);},
                                    child: Align(
                                      child: Text('8',style: TextStyle(color:Colors.white)),),
                                    splashColor: Palatte.yellow1,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            child: ClipOval(
                              child: Container(
                                width: 52.0, height: 52.0,
                                decoration: BoxDecoration(
                                  borderRadius: new BorderRadius.circular(
                                      25.0),
                                ),
                                child: Material(
                                  color: Palatte.ptrnColor,
                                  child: InkWell(
                                    onTap: () { getKeyValue(9);},
                                    child: Align(
                                      child: Text('9',style: TextStyle(color:Colors.white)),),
                                    splashColor: Palatte.yellow1,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Container(
                            child: ClipOval(
                              child: Container(
                                width: 52.0, height: 52.0,
                                decoration: BoxDecoration(
                                  borderRadius: new BorderRadius.circular(
                                      25.0),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            child: ClipOval(
                              child: Container(
                                width: 52.0, height: 52.0,
                                decoration: BoxDecoration(
                                  borderRadius: new BorderRadius.circular(
                                      25.0),
                                ),
                                child: Material(
                                  color: Palatte.ptrnColor,
                                  child: InkWell(
                                      onTap: () { getKeyValue(0);},
                                      child: Align(
                                        child: Text('0',style: TextStyle(color:Colors.white)),),
                                      splashColor: Palatte.yellow1
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            child: ClipOval(
                              child: Container(
                                width: 52.0, height: 52.0,
                                decoration: BoxDecoration(
                                  borderRadius: new BorderRadius.circular(
                                      25.0),
                                ),
                                child: Material(
                                  color: Palatte.ptrnColor,
                                  child: InkWell(
                                      onTap: () { getKeyValue(10);},
                                      child: Align(
                                        child: Text(
                                            'C',style: TextStyle(color:Colors.white)),),
                                      splashColor: Palatte.yellow1
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),SizedBox(height: 20),

                    ],
                  )
                      : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CircularProgressIndicator()
                    ],
                  ),
                )

              ]
          ),

        ],
      ),
    );
  }
}
