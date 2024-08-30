import 'package:flutter/foundation.dart';

class LoginRequest{
  String? email;
  String? password;
  LoginRequest({this.email,this.password});
  Map<String,dynamic> toJson(){
    Map<String,dynamic> mapping = {
      'email':email,
      'password':password,
    };
    return mapping;
  }
}
class LoginResponse
{
  String? token;
  bool? status;
  User? user;
  LoginResponse({this.status,this.token,this.user});
  factory LoginResponse.fromJSON(Map<String,dynamic> map)
  {
    return LoginResponse(
      token: map['token'] != null ? map['token'] : "",
      user: User.fromJson(map['user'])
    );
  }
}
class User
{

  int? emp_id;
  String? name;
  String? role;
  String? email;
  String? contact;
  String? joining_date;

  User({this.emp_id,this.name,this.role,this.email,this.contact,this.joining_date});

  factory User.fromJson(Map<String, dynamic> obj) {
    return User(
        emp_id: obj['id'] != null ? obj['id'] : null,
        name: obj['name'] != null ?obj['name'] :'',
        role: obj['role'] != null ? obj['role']:'',
        email:obj['email'] != null ?obj['email'] :'',
        contact:obj['contact'] != null ? obj['contact']:'',
        joining_date: obj['joining_date'] != null ? obj['joining_date'] :''
    );
  }

}
