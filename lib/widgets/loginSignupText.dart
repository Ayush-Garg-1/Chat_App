import 'package:flutter/material.dart';

class LoginSignupTextWedgit extends StatelessWidget {
  String? text;
  LoginSignupTextWedgit({this.text});
  @override
  Widget build(BuildContext context) {
    return Text(
      text??"CREATE YOUR ACCOUNT",
      style: TextStyle(fontSize:17,color: Colors.white70),
    );
  }
}
