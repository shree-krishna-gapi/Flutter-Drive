import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
//import 'package:mlkit/mlkit.dart';
import 'dart:io';
import 'dart:async';
import 'package:firebase_ml_vision/firebase_ml_vision.dart';
void main()=>runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}
class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  File pickedImage;
  bool isImageLoaded = false;
  String ans = '';
  String aaa = '';
  Future pickImage() async {
    ans = '';
    aaa = '';
    var tempStore = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      pickedImage = tempStore;
      isImageLoaded = true;
    });
  }

  Future pickCamera() async {

    var tempStore = await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      pickedImage = tempStore;
      isImageLoaded = true;
      ans = '';
      aaa = '';
    });
  }


  Future readText() async {
    setState(() {
      ans = '';
      aaa = '';
    });

    FirebaseVisionImage ourImage = FirebaseVisionImage.fromFile(pickedImage);
    TextRecognizer recognizeText = FirebaseVision.instance.textRecognizer();
    VisionText readText = await recognizeText.processImage(ourImage);
    for(TextBlock block in readText.blocks) {
      for(TextLine line in block.lines) {
        for(TextElement word in line.elements) {

          ans = ans+word.text;

        }

      }
    }
      setState(() {
        aaa = ans;
      });
    print(aaa);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            isImageLoaded ? Center(
              child: Container(
                height: 220, width: 220,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: FileImage(pickedImage),fit: BoxFit.cover
                    )
                ),
              ),
            ): Container(height: 220,),
            SizedBox(height: 40,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(

                  child: Material(
                    color: Colors.blueGrey,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: InkWell(
                        onTap: pickCamera,
                        child: Align(
                          child: Text(
                            'pick from camera',style: TextStyle(color: Colors.white),),
                        ),splashColor: Colors.deepOrangeAccent,
                      ),
                    ),
                  ),


                  decoration: BoxDecoration(
                      boxShadow: [BoxShadow(
                        color: Colors.black38,
                        blurRadius: 6.0,
                        offset: Offset(
                          2.0, // Move to right 10  horizontally
                          2.0, // Move to bottom 10 Vertically
                        ),
                      ),]

                  ),
                ),
                SizedBox(width: 10,),

                Container(

                    child: Material(
                      color: Colors.blueGrey,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: InkWell(
                          onTap: pickImage,
                          child: Align(
                            child: Text(
                              'pick from gallery',style: TextStyle(color: Colors.white),),
                          ),splashColor: Colors.deepOrangeAccent,
                        ),
                      ),
                    ),


                  decoration: BoxDecoration(
                      boxShadow: [BoxShadow(
                        color: Colors.black38,
                        blurRadius: 6.0,
                        offset: Offset(
                          2.0, // Move to right 10  horizontally
                          2.0, // Move to bottom 10 Vertically
                        ),
                      ),]

                  ),
                ),

              ],

            ),
            SizedBox(height: 10,),
            Container(
              width: 264,

              child: Material(
                color: Colors.blueGrey,
                child: InkWell(
                  onTap: readText,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Align(
                      child: Text(
                        'Read Text',style: TextStyle(color: Colors.white),),
                    ),
                  ),splashColor: Colors.deepOrangeAccent,
                ),

              ),
              decoration: BoxDecoration(
              boxShadow: [BoxShadow(
                color: Colors.black38,
                blurRadius: 6.0,
                offset: Offset(
                  2.0, // Move to right 10  horizontally
                  2.0, // Move to bottom 10 Vertically
                ),
              ),]
              ),
            ),
           Padding(
             padding: const EdgeInsets.all(12.0),
             child: Text('$aaa'),
           )

          ],
        ),
      ),
    );
  }
}
