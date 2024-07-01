import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

import '../fetch_jsondata.dart';

class UsersScreen extends StatefulWidget {
  @override
  State<UsersScreen> createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: 
        FutureBuilder(
            future: fetchUserData(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<Users> users = snapshot.data;
                return ListView.builder(
                    itemCount: users.length,
                    itemBuilder: (context, index) {
                      var data = users[index];
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
                                  child: Text(
                                    '${data.fullName} Details',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
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
                                        Text(
                                          "Id : ${data.id}",
                                          style: TextStyle(
                                              fontSize: 17,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text("Name : ${data.fullName}",
                                            style: TextStyle(
                                                fontSize: 17,
                                                fontWeight: FontWeight.bold)),
                                        Text("Email : ${data.email}",
                                            style: TextStyle(
                                                fontSize: 17,
                                                fontWeight: FontWeight.bold)),
                                        Text(
                                            "Address : ${data.address?.city}, ${data.address?.state}, ${data.address?.country}",
                                            style: TextStyle(
                                                fontSize: 17,
                                                fontWeight: FontWeight.bold)),
                                        Text(
                                            "Phone No. : ${data.phone?.number}",
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
                    });
              }
              return CircularProgressIndicator();
            }),
    );
  }
}
