
import 'package:chatapp/signup_userdata.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

class UserScreen extends StatefulWidget {
  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  List<SignupUsers>? users;
  bool isLoading=true;
  void getUsersData(){
    users = SignupService.getSignupUserData();
   setState(() {
      isLoading=false;
   });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUsersData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
             body:   ListView.builder(
                    itemCount: users?.length,
                    itemBuilder: (context, index) {
                      var data = users?[index];
                      return Column(
                        children: [
                          Container(
                            // padding: EdgeInsets.symmetric(
                            //     horizontal: 20, vertical: 10),
                            color: Color(0xffcaeafd),
                            child: ExpandablePanel(
                                theme: const ExpandableThemeData(
                                  headerAlignment:
                                  ExpandablePanelHeaderAlignment.center,
                                  tapBodyToCollapse: true,
                                  hasIcon: true,
                                  iconColor: Colors.blue,
                                  iconSize: 22,
                                  iconRotationAngle: 7,
                                  iconPadding:
                                  EdgeInsets.only(right: 20, top: 20),
                                  expandIcon: Icons.arrow_forward,
                                  collapseIcon: Icons.arrow_drop_down,
                                ),
                                header: Container(
                                  padding: EdgeInsets.only(left: 20, top: 20),
                                  child: 
                                  Row(
                                    children: [
                                      CircleAvatar(
                                        radius: 25,
                                        child: Image.network(width: 30,height: 30,data?.url ??"https://img.freepik.com/free-vector/blue-circle-with-white-user_78370-4707.jpg?size=338&ext=jpg&ga=GA1.1.1546980028.1719619200&semt=sph"),
                                      ),
                                      SizedBox(width: 15,),
                                      Text(
                                        '${data?.name}',
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  )
                                ),
                                collapsed: Text(
                                  "",
                                  softWrap: true,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                expanded: Container(
                                    padding: EdgeInsets.all(20),
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Text("Name : ${data?.name}",
                                            style: TextStyle(
                                                fontSize: 17,
                                                fontWeight: FontWeight.bold)),
                                        Text("Email : ${data?.email}",
                                            style: TextStyle(
                                                fontSize: 17,
                                                fontWeight: FontWeight.bold)),
                                        Text(
                                            "Address : ${data?.address}",
                                            style: TextStyle(
                                                fontSize: 17,
                                                fontWeight: FontWeight.bold)),
                                        Text(
                                            "Phone No. : ${data?.phone}",
                                            style: TextStyle(
                                                fontSize: 17,
                                                fontWeight: FontWeight.bold)),
                                        Text(
                                            "DOB : ${data?.dob}",
                                            style: TextStyle(
                                                fontSize: 17,
                                                fontWeight: FontWeight.bold)),
                                        Text(
                                            "Age : ${data?.age}",
                                            style: TextStyle(
                                                fontSize: 17,
                                                fontWeight: FontWeight.bold)),
                                      ],
                                    ))),
                          ),
                          SizedBox(
                            height: 20,
                          )
                        ],
                      );
                    })
             
    );
  }
}