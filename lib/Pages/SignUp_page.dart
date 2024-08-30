import 'package:crm/Model/RegisterModel.dart';
import 'package:crm/Services/UserAPIService.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'Home_page.dart';

class SignUp extends StatefulWidget {
  SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool _isObscure = true;
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController roleController = TextEditingController();
  TextEditingController dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo,
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(left: 10, right: 10, top: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "Hello there",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              const SizedBox(height: 10),
              Image.asset('assets/drawable/log1.png', height: 260),
              const SizedBox(
                height: 15,
              ),
              TextField(
                controller: nameController,
                style: TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  prefixIcon: Icon(
                    Icons.account_box_rounded,
                    color: Colors.white,
                  ),
                  border: OutlineInputBorder(),
                  counterStyle: TextStyle(color: Colors.white),
                  labelText: 'Enter Name',
                  labelStyle: TextStyle(color: Colors.white),
                ),
              ),
              const SizedBox(height: 15.0),
              TextField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  prefixIcon: Icon(
                    Icons.email_rounded,
                    color: Colors.white,
                  ),
                  border: OutlineInputBorder(),
                  labelText: 'Enter Email',
                  labelStyle: TextStyle(color: Colors.white),
                ),
              ),
              const SizedBox(height: 15.0),
              TextField(
                controller: passController,
                style: const TextStyle(color: Colors.white),
                keyboardType: TextInputType.visiblePassword,
                obscureText: _isObscure,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  prefixIcon: const Icon(
                    Icons.lock_open,
                    color: Colors.white,
                  ),
                  labelText: 'Password',
                  labelStyle: const TextStyle(color: Colors.white),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isObscure ? Icons.visibility : Icons.visibility_off,
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
              const SizedBox(height: 15.0),
              TextField(
                controller: numberController,
                keyboardType: TextInputType.number,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.call,
                    color: Colors.white,
                  ),
                  border: OutlineInputBorder(),
                  labelText: 'Contact Number',
                  labelStyle: TextStyle(color: Colors.white),
                ),
              ),
              const SizedBox(height: 15.0),
              TextField(
                controller: roleController,
                keyboardType: TextInputType.text,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.perm_identity,
                    color: Colors.white,
                  ),
                  border: OutlineInputBorder(),
                  labelText: 'Role',
                  labelStyle: TextStyle(color: Colors.white),
                ),
              ),
              const SizedBox(height: 15.0),
              TextField(
                controller: dateController,
                keyboardType: TextInputType.text,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.calendar_month_outlined,
                    color: Colors.white,
                  ),
                  border: OutlineInputBorder(),
                  labelText: 'Joining Date',
                  labelStyle: TextStyle(color: Colors.white),
                ),
                readOnly: true,
                onTap: () async {
                  DateTime? pickedDate =  await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2100));
                  if (pickedDate != null) {
                    String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
                    setState(() {
                      dateController.text = formattedDate;
                    });
                  }
                },
              ),
              const SizedBox(
                height: 25,
              ),
              ElevatedButton(
                onPressed: () {
                  print(
                      '==================================================================================');
                  var name = nameController.text;
                  var email = emailController.text;
                  var pass = passController.text;
                  var contactNumber = numberController.text;
                  var role = roleController.text;
                  var date = dateController.text;

                  print("${name},${email},${pass},${contactNumber},${role},${date}");
                  RegisterRequest register_request = RegisterRequest( name,email, pass,contactNumber, role, date);
                  UserAPIService apiService = UserAPIService();
                  apiService.userRegister(register_request).then((result) =>{
                    if(result.status == true){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Home(),))
                    }
                  } );


                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepOrange),
                child:
                    const Text('SignUp', style: TextStyle(color: Colors.white)),
              ),
              SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
