import 'package:chatapp/screens/signup_screen.dart';
import 'package:chatapp/sharedpreferences.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../widgets/button.dart';
import 'dashboard_screen.dart';

enum userDataStatus {
  Authentication_Success,
  Authentication_Fail,
  User_Not_Found
}

userDataStatus? User_Status;

class LoginScreen extends StatefulWidget {
  String? email;
  String? username;
  String? password;
  LoginScreen({this.email, this.username, this.password});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  updateWedgit() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xfffda37e), 
                Colors.orange
                ],
            ),
          ),
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.3,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.only(bottomRight: Radius.circular(120)),
                    image: DecorationImage(
                        image: AssetImage(
                      'assets/images/i1.png',
                    ))),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.7,
                child: LoginScreenWrapper(
                    context, widget.email, widget.password, widget.username,
                    () {
                  updateWedgit();
                }),
              ),
            ],
          )),
    );
  }
}

Widget? LoginScreenWrapper(
    BuildContext context, email, password, username, callbackfun) {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final form_key = GlobalKey<FormState>();

  switch (User_Status) {
    case userDataStatus.Authentication_Success:
      return AlertDialog(
        title: Text("User Authentication Successfully"),
        actions: [
          ElevatedButton(
              onPressed: () async {
                User_Status = null;
                SharedPrefsService.setUserLoginIn(true);
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => DashboardScreen()));
              },
              child: Text("User not found"))
        ],
      );
    case userDataStatus.Authentication_Fail:
      User_Status = null;
      return AlertDialog(
        title: Text("User Authentication Failed"),
        actions: [
          ElevatedButton(
              onPressed: () {
                User_Status = null;
                callbackfun();
              },
              child: Text("User not found"))
        ],
      );
    case userDataStatus.User_Not_Found:
      return AlertDialog(
        title: Text("User not found"),
        actions: [
          ElevatedButton(
              onPressed: () {
                User_Status = null;
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SignUpScreen()));
              },
              child: Text("User not found"))
        ],
      );
    default:
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome!',
              style: TextStyle(
                color: Colors.white,
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Form(
              key: form_key,
              child: Column(
                children: [
                  Container(
                    width: 300,
                    child: TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email';
                        }
                        return null;
                      },
                      controller: usernameController,
                      style: TextStyle(color: Colors.white, fontSize: 18),
                      decoration: InputDecoration(
                        label: Text("Email"),
                        labelStyle:
                            TextStyle(color: Colors.white, fontSize: 18),
                        contentPadding: EdgeInsets.all(20),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white,
                            width: 3,
                          ),
                          borderRadius: BorderRadius.circular(11),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white,
                            width: 3,
                          ),
                          borderRadius: BorderRadius.circular(11),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white,
                            width: 3,
                          ),
                          borderRadius: BorderRadius.circular(11),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 12),
                  Container(
                    width: 300,
                    child: TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        }
                        return null;
                      },
                      style: TextStyle(color: Colors.white, fontSize: 18),
                      controller: passwordController,
                      decoration: InputDecoration(
                        label: Text("Password"),
                        labelStyle:
                            TextStyle(color: Colors.white, fontSize: 18),
                        contentPadding: EdgeInsets.all(20),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white,
                            width: 3,
                          ),
                          borderRadius: BorderRadius.circular(11),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white,
                            width: 3,
                          ),
                          borderRadius: BorderRadius.circular(11),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white,
                            width: 3,
                          ),
                          borderRadius: BorderRadius.circular(11),
                        ),
                        disabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white,
                            width: 3,
                          ),
                          borderRadius: BorderRadius.circular(11),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  CommonButton(
                      buttonText: "LOGIN",
                      callback: () {
                        if (form_key.currentState!.validate()) {
                          if (email == null ||
                              username == null ||
                              password == null) {
                            User_Status = userDataStatus.User_Not_Found;
                            callbackfun();
                          } else if (email == usernameController.text &&
                              password == passwordController.text) {
                            User_Status = userDataStatus.Authentication_Success;
                            callbackfun();
                          } else {
                            User_Status = userDataStatus.Authentication_Fail;
                            callbackfun();
                          }
                        }
                      }),
                  SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      FaIcon(FontAwesomeIcons.google,
                          size: 30, color: Colors.white),
                      FaIcon(FontAwesomeIcons.twitter,
                          size: 30, color: Colors.white),
                      FaIcon(FontAwesomeIcons.instagram,
                          size: 30, color: Colors.white),
                    ],
                  ),
                  SizedBox(height: 30),
                  GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SignUpScreen()));
                      },
                      child: RichText(
                        text: TextSpan(
                            text: "Don't have an account?  ",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                            children: [
                              TextSpan(
                                  text: "SignUp",
                                  style: TextStyle(
                                      fontSize: 15,
                                      decoration: TextDecoration.underline,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white))
                            ]),
                      )),
                ],
              ),
            )
          ],
        ),
      );
  }
}
