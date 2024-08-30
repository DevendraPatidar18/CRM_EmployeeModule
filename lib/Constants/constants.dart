import 'package:flutter/material.dart';
class MyDefaultWidget extends StatefulWidget {
  const MyDefaultWidget({super.key});

  @override
  State<MyDefaultWidget> createState() => _MyDefaultWidgetState();
}

class _MyDefaultWidgetState extends State<MyDefaultWidget> {
 @override


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }


}
var mydefaltbackground = Colors.grey[100];

    var myDrawer = Drawer(

      backgroundColor: Colors.blue[400],
      child: const Column(children: [
        DrawerHeader(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.account_box,
                color: Colors.white,
              ),
              Text(
                'Employee',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ),
        ListTile(
          leading: Icon(Icons.interests_outlined,color: Colors.white,),
          title: Text(
            'View Customer Interests',
            style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),
          ),
        ),
        ListTile(
          leading: Icon(Icons.feedback_outlined,color: Colors.white,),
          title: Text(
            'Client Feedback',
            style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),
          ),
        ),
        ListTile(
          leading: Icon(Icons.report_outlined,color: Colors.white,),
          title: Text(
            'Report',
            style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),
          ),
        ),
        Divider(thickness: 1,color: Colors.white,height: 1),
        ListTile(
          leading: Icon(Icons.group_outlined,color: Colors.white,),
          title: Text(
            'About',
            style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),
          ),
        ),
        SizedBox(height: 5),
        ListTile(
          leading: Icon(Icons.logout,color: Colors.red,),
          title: Text(
            'Log out',
            style: TextStyle(fontWeight: FontWeight.bold,color: Colors.red),
          ),
        ),
      ]),
    );

