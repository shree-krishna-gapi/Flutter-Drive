import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Welcome extends StatefulWidget {
//  const Welcome({Key key, this.user}) : super(key: key);
//  final FirebaseUser user;
  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
//          Text('LogIn By: ${widget.user.email}'),
          Text('Welcome to HomeScreen.')
        ],
      ),
    );
  }
}
