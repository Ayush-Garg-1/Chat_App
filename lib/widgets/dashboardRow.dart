import 'package:flutter/material.dart';

import 'dashboardRowContainer.dart';

class DashboardRowWidget extends StatelessWidget {
  String? box1Text;
  var icon1;
  String? box2Text;
  var icon2;
  DashboardRowWidget({this.box1Text,this.icon1,this.box2Text,this.icon2});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        DashboardRowContainer(icon: icon1,boxText: box1Text,),
        SizedBox(width: 20,),
        DashboardRowContainer(icon: icon2,boxText: box2Text,),
      ],
    );
  }
}
