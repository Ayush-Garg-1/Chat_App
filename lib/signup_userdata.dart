class SignupService{
  static List<Map> signupUsers = [];
 static List<SignupUsers>  getSignupUserData(){
  List<SignupUsers> usersDataList = [];
  signupUsers.forEach((data){
    SignupUsers user = SignupUsers(
      name:data['name'],
      email:data['email'],
      address:data['address'],
      phone:data['phone'],
      dob:data['dob'],
      age:data['age'],
      url:data['url'],
    );
    usersDataList.add(user);
  });
  return usersDataList;
}
}

class SignupUsers{
  String? name;
  String? email;
  String? address;
  String? phone;
  String? dob;
  String? age;
  String? url;
  SignupUsers({this.name,this.email,this.address,this.phone,this.dob,this.age,this.url});
}