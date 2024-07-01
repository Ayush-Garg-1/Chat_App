import 'package:chatapp/screens/dashboard_screen.dart';
import 'package:chatapp/signup_userdata.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../widgets/button.dart';
import 'package:image_picker/image_picker.dart';
import 'package:chatapp/sharedpreferences.dart';

import 'package:intl/intl.dart';

class SignUpScreen extends StatefulWidget {
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final form_Key = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController userAddress = TextEditingController();
  TextEditingController userAge = TextEditingController();
  TextEditingController dateInput = TextEditingController();
  bool _isChecked = false;
  String? profile_path;

  final picker = ImagePicker();
  Future getImage(ImageSource source) async {
    final pickedFile = await picker.pickImage(source: source);

    try {
      if (pickedFile != null) {
        await SharedPrefsService.setImagePath(pickedFile.path);
        profile_path = await SharedPrefsService.getUserInfo("profilePath");
        setState(() {});
      } else {
        print('No image selected.');
      }
    } catch (e) {
      print("My Error" + e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    var column = StreamBuilder<Object>(
        stream: null,
        builder: (context, snapshot) {
          return SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.3,
                  
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        blurRadius: 10,
                      )
                    ],
                      borderRadius:
                          BorderRadius.only(bottomRight: Radius.circular(150))),
                  child: InkWell(
                      onTap: () {
                        showModalBottomSheet(
                            backgroundColor: Colors.orange,
                            context: context,
                            builder: (context) {
                              return Container(
                                  width: MediaQuery.of(context).size.width,
                                  height:
                                      MediaQuery.of(context).size.height * 0.28,
                                  color: Colors.orange,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          getImage(ImageSource.gallery);
                                        },
                                        child: Icon(Icons.camera,
                                            size: 50, color: Colors.white),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          getImage(ImageSource.camera);
                                        },
                                        child: Icon(Icons.camera_alt_rounded,
                                            size: 50, color: Colors.white),
                                      ),
                                    ],
                                  ));
                            });
                      },
                      child: Center(
                        child: Container(
                            width: 120,
                            height: 120,
                            decoration: BoxDecoration(
                              color: Colors.white,
                             boxShadow:[
                              BoxShadow(
                                color: Colors.orange,
                                blurRadius: 10,
                              )
                             ],
                              shape: BoxShape.circle,
                            ),
                            child: profile_path == null
                                ? Center(child: Image.asset('assets/images/user.png',width: 90,height: 90,),)
                                : Center(
                                  child: Image.network(
                                    width: 90,
                                    height: 90,
                                      profile_path!,
                                    ),
                                )),
                      )),
                ),
                Form(
                  key: form_Key,
                  child: Column(
                    children: [
                      SizedBox(height: 30,),
                      Container(
                        width: 300,
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please Enter Username";
                            }
                            return null;
                          },
                          controller: username,
                          style: TextStyle(color: Colors.white, fontSize: 18),
                          decoration: InputDecoration(
                            label: Text("Username"),
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
                            focusedBorder: OutlineInputBorder(
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
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Container(
                        width: 300,
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please Enter Email";
                            }
                            return null;
                          },
                          controller: email,
                          style: TextStyle(color: Colors.white, fontSize: 18),
                          decoration: InputDecoration(
                            label: Text("Email"),
                            labelStyle:
                                TextStyle(color: Colors.white, fontSize: 18),
                            contentPadding: EdgeInsets.all(20),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.red,
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
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.white,
                                width: 3,
                              ),
                              borderRadius: BorderRadius.circular(11),
                            ),
                          ),
                          cursorColor: Colors.white,
                        ),
                      ),
                      SizedBox(height: 12),
                      Container(
                        width: 300,
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please Enter Address";
                            }
                            return null;
                          },
                          controller: userAddress,
                          style: TextStyle(color: Colors.white, fontSize: 18),
                          decoration: InputDecoration(
                            label: Text("User address"),
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
                            focusedBorder: OutlineInputBorder(
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
                          ),
                        ),
                      ),
                      SizedBox(height: 12),
                      Container(
                        width: 300,
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please Enter Age";
                            }if((int.parse(value)) <= 18){
                              return "You are not 18+";
                            }
                            return null;
                          },
                          controller: userAge,
                          style: TextStyle(color: Colors.white, fontSize: 18),
                          decoration: InputDecoration(
                            label: Text("User age"),
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
                            focusedBorder: OutlineInputBorder(
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
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Container(
                        width: 300,
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please Enter DOB";
                            }
                            return null;
                          },
                          onTap: () async {
                            DateTime? pickedDate = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(1950),
                                lastDate: DateTime(2100));
                            if (pickedDate != null) {
                              String dob =
                                  DateFormat('dd/MM/yyyy').format(pickedDate);

                              var currDate = DateTime.now();
                              String currentDate =
                                  DateFormat('dd/MM/yyyy').format(currDate);
                              DateTime parsedDate1 =
                                  DateFormat("dd/MM/yyyy").parse(dob);
                              DateTime parsedDate2 =
                                  DateFormat("dd/MM/yyyy").parse(currentDate);
                              int days =
                                  parsedDate2.difference(parsedDate1).inDays;
                              int years = (days / 365).toInt();
                              userAge.text = years.toString();
                              dateInput.text = dob;
                              setState(() {});
                            }
                          },
                          controller: dateInput,
                          style: TextStyle(color: Colors.white, fontSize: 18),
                          decoration: InputDecoration(
                            label: Text("DOB"),
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
                            focusedBorder: OutlineInputBorder(
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
                          ),
                        ),
                      ),
                      SizedBox(height: 12),
                      // Container(
                      //   width: 300,
                      //   child: TextFormField(
                      //     validator: (value) {
                      //       if (value == null || value.isEmpty) {
                      //         return "Please Enter Password";
                      //       }
                      //       return null;
                      //     },
                      //     controller: password,
                      //     style: TextStyle(color: Colors.white, fontSize: 18),
                      //     decoration: InputDecoration(
                      //       label: Text("Password"),
                      //       labelStyle:
                      //           TextStyle(color: Colors.white, fontSize: 18),
                      //       contentPadding: EdgeInsets.all(20),
                      //       border: OutlineInputBorder(
                      //         borderSide: BorderSide(
                      //           color: Colors.white,
                      //           width: 6,
                      //         ),
                      //         borderRadius: BorderRadius.circular(11),
                      //       ),
                      //       focusedBorder: OutlineInputBorder(
                      //         borderSide: BorderSide(
                      //           color: Colors.white,
                      //           width: 3,
                      //         ),
                      //         borderRadius: BorderRadius.circular(11),
                      //       ),
                      //       enabledBorder: OutlineInputBorder(
                      //         borderSide: BorderSide(
                      //           color: Colors.white,
                      //           width: 3,
                      //         ),
                      //         borderRadius: BorderRadius.circular(11),
                      //       ),
                      //     ),
                      //   ),
                      // ),
                      // SizedBox(height: 12),
                      Container(
                        width: 300,
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please Enter phone no.";
                            }
                            return null;
                          },
                          controller: phone,
                          style: TextStyle(color: Colors.white, fontSize: 18),
                          decoration: InputDecoration(
                            label: Text("Phone No."),
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
                            focusedBorder: OutlineInputBorder(
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
                          ),
                        ),
                      ),
                      SizedBox(height: 12),
                      Padding(
                        padding: EdgeInsets.only(left: 62),
                        child: FormField(
                          builder: (FormFieldState<bool> state) {
                            return Column(
                              children: [
                                Row(
                                  children: [
                                    Checkbox(
                                      side: BorderSide(
                                        color: Colors.white,
                                        width: 2,
                                      ),
                                      value: _isChecked,
                                      onChanged: (bool? value) {
                                        setState(() {
                                          _isChecked = value!;
                                        });
                                      },
                                    ),
                                    Text(
                                      'I agree to the terms and conditions',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 13,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                ),
                                if (state.hasError)
                                  Text(
                                    state.errorText!,
                                    style: TextStyle(color: Colors.red),
                                  ),
                              ],
                            );
                          },
                          validator: (value) {
                            if (!_isChecked) {
                              return 'Required!';
                            }
                            return null;
                          },
                        ),
                      ),
                      SizedBox(height: 12),
                      CommonButton(
                          buttonText: "CREATE ACCOUNT",
                          callback: () {
                            if (form_Key.currentState!.validate()) {
                              if (profile_path != "") {
                                SignupService.signupUsers.add({
                                  "name": username.text,
                                  "email": email.text,
                                  "address": userAddress.text,
                                  "phone": phone.text,
                                  "dob": dateInput.text,
                                  "age": userAddress.text,
                                  "url":profile_path,
                                });
                                SharedPrefsService.setUserInfo(
                                    "user_name", username.text);
                                SharedPrefsService.setUserInfo(
                                    "user_email", email.text);
                                SharedPrefsService.setUserInfo(
                                    "user_address", userAddress.text);
                                SharedPrefsService.setUserInfo(
                                    "user_phone", phone.text);
                                SharedPrefsService.setUserInfo(
                                    "user_password", password.text);
                                SharedPrefsService.setUserAge(
                                    int.parse(userAge.text));
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            DashboardScreen()));
                              }
                            }
                          }),
                    SizedBox(height: 15,)
                    ],
                  ),
                ),
              ],
            ),
          );
        });
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xfffda37e), Colors.orange],
          ),
        ),
        child: Center(
          child: column,
        ),
      ),
    );
  }
}
