import 'package:flutter/material.dart';
class DashboardCircleAvatar extends StatelessWidget {
  var icon=Icons.supervised_user_circle_outlined;
  DashboardCircleAvatar({required this.icon});
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 30,
      backgroundColor: Colors.green,
      child: Icon(icon,color: Colors.white,size: 40,),
    );
  }
}
