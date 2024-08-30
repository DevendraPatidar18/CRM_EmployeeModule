import 'package:crm/Model/LoginModel.dart';
import 'package:crm/Pages/Call_history_page.dart';
import 'package:crm/Pages/Login_page.dart';
import 'package:crm/Pages/Profile_page.dart';
import 'package:crm/Pages/View_product_Page.dart';
import 'package:crm/Pages/enquires_page.dart';
import 'package:flutter/material.dart';
import '../Constants/constants.dart';
import '../Pages/Dashboard.dart';


class Mobile_Scaffold extends StatefulWidget {
  LoginRequest? profileData;
   Mobile_Scaffold({super.key,LoginRequest? profileData});

  @override
  State<Mobile_Scaffold> createState() => _Mobile_ScaffoldState();
}

class _Mobile_ScaffoldState extends State<Mobile_Scaffold> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 40,
          iconTheme: const IconThemeData(color: Colors.white),
          backgroundColor: Colors.blue[400],
          title: const Text(
            "Home",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          actions: <Widget>[
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) =>  Profile(profileDataObject: widget.profileData!,)));
              },
              child: CircleAvatar(
                child: Image.asset(
                  'assets/drawable/profileicon.png',
                  height: 40,
                  width: 40,
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            )
          ],
        ),
        backgroundColor: mydefaltbackground,
        drawer: myDrawer,
        body: DefaultTabController(
          length: 4,
          child: Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              iconTheme: const IconThemeData(
                color: Colors.white,
              ),
              flexibleSpace: Container(
                decoration: BoxDecoration(color: Colors.blue[400]),
              ),
              title: const TabBar(
                tabs: [
                  Tab(
                    icon: Icon(
                      Icons.home,
                      color: Colors.white,
                    ),
                  ),
                  Tab(
                      icon: ImageIcon(
                    AssetImage('assets/drawable/enquiry_icon.png'),
                    color: Colors.white,
                  )),
                  Tab(
                    icon: Icon(
                      Icons.view_in_ar_rounded,
                      color: Colors.white,
                    ),
                  ),
                  Tab(
                    icon: Icon(
                      Icons.call,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            body: TabBarView(children: [
              Dashboard(),
              EnquiryPage(),
              View_product()!,
              Call_history_page(),
            ]),
          ),
        ));
  }
}
