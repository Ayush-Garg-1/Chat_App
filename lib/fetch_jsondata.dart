import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Future fetchUserData() async {
  final String response =
      await rootBundle.loadString('assets/json_files/usersdata.json');
  final decodedData = await json.decode(response);
  List<Users> usersData = modledUsersData(decodedData["users"]);
  return usersData;
}

modledUsersData(List<dynamic> users) {
  List<Users> usersData = [];
  for (var data in users) {
    Map<String, dynamic> phonedata = data['phone_numbers'][0];
    Address address = Address(
      city: data['address']['city'],
      state: data['address']['state'],
      country: data['address']['country'],
    );
    PhoneNumber phoneDetails = PhoneNumber(
      type: phonedata['type'],
      number: phonedata['number'],
    );
    Users user = Users(
        id: data['id'],
        fullName: data['full_name'],
        email: data['email'],
        address: address,
        phone: phoneDetails);
    usersData.add(user);
  }
  return usersData;
}

class Users {
  int? id;
  String? fullName;
  String? email;
  Address? address;
  PhoneNumber? phone;
  Users({this.id, this.fullName, this.email, this.address, this.phone});
}

class Address {
  String? city;
  String? state;
  String? country;
  Address({this.city, this.state, this.country});
}

class PhoneNumber {
  String? type;
  String? number;
  PhoneNumber({this.type, this.number});
}
