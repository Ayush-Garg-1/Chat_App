import 'package:flutter/material.dart';

import 'dashboardCircleAvatar.dart';

class DashboardRowContainer extends StatelessWidget {
  var icon;
  String? boxText;
  DashboardRowContainer({this.icon,this.boxText});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width*0.35,
      height: MediaQuery.of(context).size.height*0.15,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.green.withOpacity(0.4),
              blurRadius: 10,
            )
          ]
      ),
      child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              DashboardCircleAvatar(icon: icon,),
              Text(boxText!,style: TextStyle(fontWeight:FontWeight.bold,color: Colors.green),)
            ],
          )
      ),
    );
  }
}
