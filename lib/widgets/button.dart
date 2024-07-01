import 'package:flutter/material.dart';

class CommonButton extends StatelessWidget {
  String? buttonText;
  final VoidCallback? callback;
  CommonButton({this.buttonText, this.callback});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      child: ElevatedButton(
        onPressed: () {
          callback!();
        },
        child: Text(buttonText ?? "Submit",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: Color(0xd2ff5522),
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 18),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
