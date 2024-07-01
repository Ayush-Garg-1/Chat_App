import 'package:chatapp/screens/dashboard_screen.dart';
import 'package:chatapp/screens/user_screen.dart';
import 'package:chatapp/sharedpreferences.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../widgets/button.dart';

class EditPage extends StatefulWidget {
  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  final form_Key = GlobalKey<FormState>();

  TextEditingController email = TextEditingController();

  TextEditingController username = TextEditingController();

  TextEditingController password = TextEditingController();

  TextEditingController phone = TextEditingController();

  TextEditingController userAddress = TextEditingController();

  TextEditingController userAge = TextEditingController();

  TextEditingController dateInput = TextEditingController();

  String? profile_path;
  bool isLoading = true;

  final picker = ImagePicker();

  Future getImage(ImageSource source) async {
    print("ayush");
    final pickedFile = await picker.pickImage(source: source);

    try {
      if (pickedFile != null) {
        await SharedPrefsService.setImagePath(pickedFile.path);
        profile_path = await SharedPrefsService.getUserInfo("profilePath");
        setState(() {});
        print(pickedFile.path);
      } else {
        print('No image selected.');
      }
    } catch (e) {
      print("My Error" + e.toString());
    }
  }

  void getData() async {
    try {
      username.text = await SharedPrefsService.getUserInfo("user_name");
      userAddress.text = await SharedPrefsService.getUserInfo("user_address");
      email.text = await SharedPrefsService.getUserInfo("user_email");
      phone.text = await SharedPrefsService.getUserInfo("user_phone");
      userAge.text = await SharedPrefsService.getUserInfo("user_age");
      String? profilePath = await SharedPrefsService.getUserInfo("profilePath");
      profile_path = profilePath;
      setState(() {
        isLoading = false;
      });
    } catch (e) {
      print("My Error: " + e.toString());
    }
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.green, Colors.lightGreenAccent],
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                    onTap: () {
                      showModalBottomSheet(
                          backgroundColor: Colors.green,
                          context: context,
                          builder: (context) {
                            return Container(
                                width: MediaQuery.of(context).size.width,
                                height:
                                    MediaQuery.of(context).size.height * 0.20,
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
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(500),
                      child: Container(
                          width: 100,
                          height: 100,
                          color: Colors.white,
                          child: profile_path == null
                              ? Image.asset('assets/images/user.png')
                              : Image.network(
                                  profile_path!,
                                )),
                    )),
                SizedBox(height: 20),
                Form(
                  key: form_Key,
                  child: Column(
                    children: [
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
                            label: Text("UserAddress"),
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
                      SizedBox(height: 12),
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
                      CommonButton(
                          buttonText: "Edit",
                          callback: () {
                            if (form_Key.currentState!.validate()) {
                              if (profile_path != "") {
                                SharedPrefsService.setUserInfo(
                                    "user_name", username.text);
                                SharedPrefsService.setUserInfo(
                                    "user_email", email.text);
                                SharedPrefsService.setUserInfo(
                                    "user_address", userAddress.text);
                                SharedPrefsService.setUserInfo(
                                    "user_phone", phone.text);

                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            DashboardScreen()));
                              }
                            }
                          }),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
