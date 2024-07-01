import 'package:chatapp/screens/dashboard_screen.dart';
import 'package:chatapp/screens/login_screen.dart';
import 'package:chatapp/sharedpreferences.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  void checkUserLogin() async {
    bool? IsLogin;
    try {
      IsLogin = await SharedPrefsService.getUserInfo("isLogin");
    } catch (e) {
      print(e.toString());
    }
    if (IsLogin != null) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => DashboardScreen()));
    } else {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => LoginScreen()));
    }
  }

  scaleAnimationFun() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    )..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          checkUserLogin();
        } else if (status == AnimationStatus.dismissed) {
          _controller.forward();
        }
      });
    _animation = Tween<double>(begin: 1.0, end: 2.0).animate(_controller);
    _controller.forward();
  }

  @override
  void initState() {
    super.initState();
    scaleAnimationFun();
  }

  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          ScaleTransition(
            scale: _animation,
            child: Container(
              width: 300,
              height: 300,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ClipRRect(
                      borderRadius: BorderRadius.circular(500),
                      child: Image.asset("assets/images/logo.jpg")),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "WELCOME TO CHATAPP",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          )
        ]),
      ),
    );
  }
}
