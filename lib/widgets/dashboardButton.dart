import 'package:flutter/material.dart';

class DashboardButtonWedgit extends StatelessWidget {
  String? buttonText;
  var buttonBgColor = Colors.green;
  var buttonTextColor = Colors.white;
  DashboardButtonWedgit(
      {this.buttonText,
      required this.buttonBgColor,
      required this.buttonTextColor});
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      child: Text(buttonText!),
      style: ElevatedButton.styleFrom(
          padding: EdgeInsets.all(15),
          backgroundColor: buttonBgColor,
          foregroundColor: buttonTextColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          )),
    );
  }
}
