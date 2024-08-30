import 'package:crm/Model/LoginModel.dart';
import 'package:crm/Pages/Home_page.dart';
import 'package:crm/Pages/Profile_page.dart';
import 'package:crm/Pages/SignUp_page.dart';
import 'package:crm/Pages/Splash_page.dart';
import 'package:crm/Responsive_layout/mobile_scaffold.dart';
import 'package:crm/Services/UserAPIService.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
class LoginPage extends StatefulWidget {

  const LoginPage({super.key,});

  @override
  State<LoginPage> createState() => _LoginPageState();
}
void DataSavedInSharedPrefrence(String token,BuildContext context) async {
  SharedPreferences sp = await SharedPreferences.getInstance();
  sp.setString('token', token);
  Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => Home(),));
}
TextEditingController emailController = TextEditingController();
TextEditingController passControlller = TextEditingController();
class _LoginPageState extends State<LoginPage> {
  bool _isObscure = false;
  void saveData(String email,String pass) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
        sp.setString('email', email);
        sp.setString('pass', pass);

  }

@override
  void initState() {


    super.initState();
  }
  LoginRequest? login_request;
  UserAPIService? login_service;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.indigo,
        body:
        SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.only( left: 10, right: 10,top: 75),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "Hello there",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  const SizedBox(height: 15),
                  Image.asset('assets/drawable/log1.png', height: 260),
                  const SizedBox(
                    height: 15,
                  ),
                  const SizedBox(height: 15.0),
                   TextField(
                    controller:emailController,
                    keyboardType: TextInputType.emailAddress,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.email_rounded,
                        color: Colors.white,
                      ),
                      border: OutlineInputBorder(),
                      labelText: 'Enter Email',
                      labelStyle: TextStyle(color: Colors.white),
                    ),
                  ),
                  const SizedBox(height: 35.0),
                  TextField(
                    controller: passControlller,
                    style: const TextStyle(color: Colors.white),
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: _isObscure,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      prefixIcon: const Icon(
                        Icons.keyboard_hide,
                        color: Colors.white,
                      ),
                      labelText: 'Password',
                      labelStyle: const TextStyle(color: Colors.white),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _isObscure
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          setState(() {
                            _isObscure = !_isObscure;
                          });
                        },
                      ),
                    ),
                  ),

                  const SizedBox(
                    height: 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          var email = emailController.text;
                          var pass = passControlller.text;
                           login_request = LoginRequest(email: email,password: pass);
                           login_service = UserAPIService();
                          String? token;
                          Mobile_Scaffold profileData = Mobile_Scaffold(profileData: login_request);
                          login_service?.userLogin(login_request!).then((value) => {
                            print('Value Object is : ${value}'),
                            print('Value token is ${value.token}'),
                            print('User name ${value.user?.name}'),
                            token = value.token,
                            DataSavedInSharedPrefrence(token!,context),

                          });


                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.deepOrange),
                        child: const Text('Login',
                            style: TextStyle(color: Colors.white)),
                      ),
                      SizedBox(width: 20),
                      ElevatedButton(
                        onPressed: () {

                          Navigator.push(context, MaterialPageRoute(builder: (context) =>  SignUp(),));
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.deepOrange),
                        child: const Text('SignUp',
                            style: TextStyle(color: Colors.white)),
                      ),
                    ],
                  ),
                  const InkWell(
                    child: Text(
                      'Forgot password',
                      style: TextStyle(color: Colors.white),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
  }

}
