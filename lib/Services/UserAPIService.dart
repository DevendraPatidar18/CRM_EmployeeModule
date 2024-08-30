import 'dart:convert';

import 'package:crm/Model/RegisterModel.dart';
import 'package:http/http.dart'as http;

import '../Model/LoginModel.dart';
class UserAPIService{
  Future<RegisterResponse> userRegister(RegisterRequest register_request) async {
    String registerAPI = "http://tutorials.codebetter.in:7088/registration";
    final response = await http.post(Uri.parse(registerAPI),body: register_request.toJson());
    var data = jsonDecode(response.body);
    if(data["status"]){
      print('Success Response is : ${data}');
      return RegisterResponse.fromJSON(data);
    }
    else{
      print('Register Faild ...${data}');
      throw Exception("Faild");
    }
  }
  Future<LoginResponse> userLogin(LoginRequest request)
  async{
    String api = "http://tutorials.codebetter.in:7088/login";
    final response = await http.post(Uri.parse(api),body: request.toJson());
    print("Login Response Object is : ${response}");
    print("Login Response Body is : ${response.body}");

    var data = jsonDecode(response.body);
    if(data["status"]){
      print('Success Response is : ${data}');
      return LoginResponse.fromJSON(data['data']);
    }
    else{
      print('Register Faild ...${data}');
      throw Exception("Faild");
    }
  }

}
