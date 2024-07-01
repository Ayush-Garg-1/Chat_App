import 'package:chatapp/sharedpreferences.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'dashboardButton.dart';
import 'dashboardCircleAvatar.dart';

class DashboardTopContainer extends StatefulWidget {
  @override
  State<DashboardTopContainer> createState() => _DashboardTopContainerState();
}

class _DashboardTopContainerState extends State<DashboardTopContainer> {
  String? profile;
  Future<void> getProfileImagePath() async {
    try {
      String? profilePath = await SharedPrefsService.getUserInfo("profilePath");
     
      if (profilePath != null) {
        setState(() {
          profile = profilePath;
        });
      } else {
        print("Image Path Is Null");
      }
      print("My profile....... " + profile!);
    } catch (e) {
      print("Error In Dashboard Catch Bolck :" + e.toString());
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getProfileImagePath();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: 70,
          decoration: BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(25),
                bottomLeft: Radius.circular(25)),
          ),
        ),
        Center(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.95,
            height: MediaQuery.of(context).size.height * 0.18,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(11),
                boxShadow: [
                  BoxShadow(
                    color: Colors.green.withOpacity(0.4),
                    blurRadius: 10,
                  ),
                ]),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "FIRSTNAME LASTNAME",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.green),
                      ),
                      Text("Collage Name",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          DashboardButtonWedgit(
                            buttonText: "TODO LIST",
                            buttonTextColor: Colors.white,
                            buttonBgColor: Colors.green,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          DashboardButtonWedgit(
                              buttonText: "EDIT PROFILE",
                              buttonTextColor: Colors.white,
                              buttonBgColor: Colors.green),
                        ],
                      )
                    ],
                  ),
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.green,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: FadeInImage.assetNetwork(
                        placeholder:
                            'assets/images/logo.jpg', // You need to add this asset
                        image: profile ??
                            "https://icons.veryicon.com/png/o/internet--web/prejudice/user-128.png",
                        fit: BoxFit.cover,
                        width: 60,
                        height: 60,
                        imageErrorBuilder: (context, error, stackTrace) {
                          return Image.network(
                            'assets/images/logo.jpg', // You need to add this asset
                            fit: BoxFit.cover,
                            width: 60,
                            height: 60,
                          );
                        },
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
