import 'package:chatapp/screens/dashboard_data_screen.dart';
import 'package:chatapp/screens/signup_screen.dart';
import 'package:chatapp/screens/user_screen.dart';
import 'package:chatapp/screens/users_screen.dart';
import 'package:chatapp/sharedpreferences.dart';
import 'package:flutter/material.dart';
class DashboardScreen extends StatefulWidget {
  String? email;
  String? name;
  DashboardScreen({this.email, this.name});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  PageController pageViewController = PageController();
  List<String> appBarTitle = ['Dashboard', 'Users Details', 'Chats Now'];

  int selectedIconIndex = 0;
  void updateScreen(int index) {
    setState(() {
      selectedIconIndex = index;
    });
    pageViewController.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            indicatorColor: Colors.white,
            indicatorWeight: 6,
            tabs: [
              Tab(
                  icon: Icon(
                Icons.dashboard,
                color: Colors.white,
                size: 30,
              )),
              Tab(
                  icon: Icon(
                Icons.person,
                color: Colors.white,
                size: 30,
              )),
              Tab(
                  icon: Icon(
                Icons.settings,
                color: Colors.white,
                size: 30,
              )),
            ],
          ),
          title: Padding(
            padding: EdgeInsets.all(20),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(appBarTitle[selectedIconIndex],
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.white)),
                  InkWell(
                    onTap: () {
                      SharedPrefsService.userLogout();
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignUpScreen()));
                    },
                    child: Icon(
                      Icons.logout,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                ]),
          ),
          backgroundColor: Colors.green,
        ),
        body: TabBarView(
          children: <Widget>[
            DashboardDataScreen(pageViewController: pageViewController),
            UsersScreen(),
            UserScreen()
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectedIconIndex, //New
          onTap: updateScreen,
          backgroundColor: Colors.green,
          elevation: 10,
          unselectedIconTheme: IconThemeData(color: Colors.white),
          selectedIconTheme: IconThemeData(color: Colors.orange, size: 30),
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.dashboard),
              label: 'Calls',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.data_array),
              label: 'Users',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_2_rounded),
              label: 'User',
            ),
          ],
        ),
      ),
    );
  }
}
