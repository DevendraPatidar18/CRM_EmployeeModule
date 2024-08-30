import 'dart:async';
import 'package:crm/Pages/Home_page.dart';
import 'package:crm/Pages/Login_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Model/LoginModel.dart';
import '../Responsive_layout/mobile_scaffold.dart';
import '../Services/UserAPIService.dart';

class SplashPage extends StatefulWidget {

   SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState()  {
    super.initState();
    Timer(Duration(seconds: 5), getDataFromSharedPreferences);
  }

  void getDataFromSharedPreferences() async {
    SharedPreferences s = await SharedPreferences.getInstance();
    String? token = s.getString('token');
    if (token != null) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Home()));
    }
    else{
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage()));
    }
  }

    @override
    Widget build(BuildContext context) {
      return const Scaffold(
        backgroundColor: Colors.blue,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Welcome Users", style: TextStyle(color: Colors.white),)
            ],
          ),),);

  }
}

