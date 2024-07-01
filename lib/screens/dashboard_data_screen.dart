import 'package:chatapp/screens/user_screen.dart';
import 'package:chatapp/screens/users_screen.dart';
import 'package:flutter/material.dart';
import '../widgets/dashboardRow.dart';
import '../widgets/dashboardTopContainer.dart';

class DashboardDataScreen extends StatefulWidget {
  PageController? pageViewController;
  DashboardDataScreen({this.pageViewController});
  @override
  State<DashboardDataScreen> createState() => _DashboardDataScreenState();
}

class _DashboardDataScreenState extends State<DashboardDataScreen> {
  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: widget.pageViewController,
      children: [
        SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: Colors.grey.withOpacity(0.3),
            child: Column(
              children: [
                DashboardTopContainer(),
                SizedBox(
                  height: 30,
                ),
                Column(
                  children: [
                    DashboardRowWidget(
                      box1Text: "CONTRIBUTE",
                      icon1: Icons.add,
                      box2Text: "PRACTICE",
                      icon2: Icons.note,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    DashboardRowWidget(
                      box1Text: "LEARN",
                      icon1: Icons.leaderboard_rounded,
                      box2Text: "INTERESTS",
                      icon2: Icons.interests,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    DashboardRowWidget(
                      box1Text: "HELP",
                      icon1: Icons.help,
                      box2Text: "SETTINGS",
                      icon2: Icons.settings,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        UsersScreen(),
        UserScreen(),
      ],
    );
  }
}
