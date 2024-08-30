import 'package:crm/Model/LoginModel.dart';
import 'package:crm/Pages/Enquiry_List_page.dart';
import 'package:crm/Services/UserAPIService.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Profile extends StatefulWidget {
  late LoginRequest profileDataObject;
   Profile({super.key, required LoginRequest profileDataObject});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String? token;
  String? name;
  String? role;
  String? exparties;
  String? id;
  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    token = sp.getString('token');
    UserAPIService service =  new UserAPIService();
    service.userLogin(widget.profileDataObject).then((value) => {
          print('Value Object is : ${value}'),
          print('Value token is ${value.token}'),
          print('User name ${value.user?.name}'),
          token = value.token,
          id = value.user?.emp_id.toString(),
          name = value.user?.name,
          role = value.user?.role,
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.blue[400],
        title: const Text('Profile', style: TextStyle(color: Colors.white)),
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/drawable/screenbackground.png'),
                fit: BoxFit.fill)),
        padding: const EdgeInsets.only(top: 40, right: 5, left: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Container(
                width: 150,
                height: 150,
                child: CircleAvatar(
                    radius: 50,
                    child: Image.asset('assets/drawable/profileicon.png',
                        width: 140, height: 140)),
              )
            ]),
            const SizedBox(height: 15),
            ElevatedButton(
                onPressed: () {},
                child: const Text(
                  'Change Image',
                  style: TextStyle(color: Colors.black),
                )),
            ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(30)),
              child: Card(
                elevation: 5,
                child: ListTile(
                  tileColor: Colors.grey[300],
                  leading: Icon(Icons.person),
                  title: Text(
                    name.toString(),
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  subtitle: Text('Name'),
                ),
              ),
            ),
            const SizedBox(height: 3),
            ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(30)),
              child: Card(
                elevation: 5,
                child: ListTile(
                  tileColor: Colors.grey[300],
                  leading: Icon(Icons.perm_identity),
                  title: Text(
                    id.toString(),
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  subtitle: Text('Id'),
                ),
              ),
            ),
            const SizedBox(height: 3),
            ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(30)),
              child: Card(
                elevation: 5,
                child: ListTile(
                  tileColor: Colors.grey[300],
                  leading: Icon(Icons.accessibility),
                  title:
                      Text(role.toString(), style: TextStyle(fontWeight: FontWeight.w600)),
                  subtitle: Text('Role'),
                ),
              ),
            ),
            const SizedBox(height: 3),
            ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(30)),
              child: Card(
                elevation: 5,
                child: ListTile(
                  tileColor: Colors.grey[300],
                  title: Text(
                    'Leptop',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  subtitle: Text('Experties'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

