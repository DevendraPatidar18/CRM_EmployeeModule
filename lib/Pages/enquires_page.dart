import 'package:crm/Pages/Add_Enquirey_page.dart';
import 'package:crm/Pages/Assigned_Enquiry_page.dart';
import 'package:crm/Pages/Enquiry_List_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

import '../Constants/constants.dart';
import 'Profile_page.dart';

class EnquiryPage extends StatefulWidget {
  const EnquiryPage({super.key});

  @override
  State<EnquiryPage> createState() => _EnquiryPageState();
}

class _EnquiryPageState extends State<EnquiryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mydefaltbackground,
      body: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            iconTheme: IconThemeData(
              color: Colors.white,
            ),
            flexibleSpace: Container(
              decoration: BoxDecoration(color: Colors.blue[400]),
            ),
            title: const  TabBar(
              tabs: [
                Tab(
                 icon:ImageIcon(AssetImage('assets/drawable/enquiry_icon.png'),color: Colors.white,),
                ),
                Tab(
                  icon: Icon(
                    Icons.assignment_outlined,

                    color: Colors.white,
                  ),
                  height: 40,
                )
              ],
            ),
          ),
          body: TabBarView(children: [
            Enquiey_List(),
            Assigned_Enquiry(),
            ]),
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => AddEnquiry()));
      },backgroundColor: Colors.lightBlueAccent,
        child: Icon(Icons.add,color: Colors.white,),),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
