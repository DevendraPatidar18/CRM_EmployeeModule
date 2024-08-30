

import 'package:crm/Model/AddEnquiryModel.dart';
import 'package:crm/Services/EnquiryAPIService.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
class AddEnquiry extends StatefulWidget {
  const AddEnquiry({super.key});

  @override
  State<AddEnquiry> createState() => _AddEnquiryState();
}

class _AddEnquiryState extends State<AddEnquiry> {
  String? token;
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController statusController = TextEditingController();
  TextEditingController sourceController = TextEditingController();
  TextEditingController referenceController = TextEditingController();
  TextEditingController enquired_ForController = TextEditingController();
  @override
  void initState() {
    super.initState();
    getDataFromSharedPrefrence();
  }
  void getDataFromSharedPrefrence() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    token =  sp.getString('token');

  }
  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.blue[50],
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          backgroundColor: Colors.blue[400],
          title: const Text(
            "Add Enquiry",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      body: SingleChildScrollView(
        child: Container(
          height: screenHeight*1.1,
          decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage('assets/drawable/screenbackground.png'),
                  fit: BoxFit.fill)
          ),
          padding: EdgeInsets.all(20),
          child:  Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
               TextField(
                 controller: nameController,
                style: TextStyle(),
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.perm_identity,
                  ),
                  border: OutlineInputBorder(),
                  counterStyle: TextStyle(color: Colors.white),
                  labelText: 'Customer Name',
                  labelStyle: TextStyle(),
                ),
              ),
              const SizedBox(height: 30.0),
              TextField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                style: TextStyle(),
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.email_rounded,
                  ),
                  border: OutlineInputBorder(),
                  labelText: 'Customer Email',
                  labelStyle: TextStyle(),
                ),
              ),
              const SizedBox(height: 30),
              TextField(
                controller: numberController,
                keyboardType: TextInputType.text,
                style: TextStyle(),
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.call,
                  ),
                  border: OutlineInputBorder(),
                  labelText: 'Contact Number',
                  labelStyle: TextStyle(),
                ),
              ),
              const SizedBox(height: 30),
              TextField(
                controller: statusController,
                keyboardType: TextInputType.text,
                style: TextStyle(),
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.update,
                  ),
                  border: OutlineInputBorder(),
                  labelText: 'Status',
                  labelStyle: TextStyle(),
                ),
              ),
              const SizedBox(height: 30),
              TextField(
                controller: sourceController,
                keyboardType: TextInputType.text,
                style: TextStyle(),
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.source_outlined,
                  ),
                  border: OutlineInputBorder(),
                  labelText: 'Source',
                  labelStyle: TextStyle(),
                ),
              ),
              const SizedBox(height: 30),
              TextField(
                controller: referenceController,
                keyboardType: TextInputType.text,
                style: TextStyle(),
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.add_comment_outlined,
                  ),
                  border: OutlineInputBorder(),
                  labelText: 'Reference',
                  labelStyle: TextStyle(),
                ),
              ),
              const SizedBox(height: 30),
               TextField(
                 controller: enquired_ForController,
                keyboardType: TextInputType.text,
                style: TextStyle(),
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.production_quantity_limits,
                  ),
                  border: OutlineInputBorder(),
                  labelText: 'Enquired For',
                  labelStyle: TextStyle(),
                ),
              ),
              const SizedBox(height: 35),
              ElevatedButton(onPressed: (){
                var name = nameController.text;
                var email = emailController.text;
                var status = statusController.text;
                var contactNumber = numberController.text;
                var source= sourceController.text;
                var reference = referenceController.text;
                var enquiry_for = enquired_ForController.text;
                AddRequest add_enquiry = AddRequest(name: name,email:email,status: status,contactNumber: contactNumber,source: source,reference: reference,enquired_For: enquiry_for);
                EnquiryAPIService enquiry_service = EnquiryAPIService();
                enquiry_service.enquiryRegister(add_enquiry, token!);
              },style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.lightBlueAccent)),
                child: const Text('Add Enquiry',style: TextStyle(color: Colors.white),),),
            ],
          ),
        ),
      )
    );
  }
}
