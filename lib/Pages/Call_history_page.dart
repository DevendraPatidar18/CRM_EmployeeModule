import 'package:flutter/material.dart';
import '../Constants/constants.dart';
import 'Call_Detail_Page.dart';

class Call_history_page extends StatefulWidget {
  const Call_history_page({super.key});

  @override
  State<Call_history_page> createState() => _Call_history_pageState();
}

class _Call_history_pageState extends State<Call_history_page> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration:const  BoxDecoration(
            image: DecorationImage(image: AssetImage('assets/drawable/screenbackground.png'),
                fit: BoxFit.fill)
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 8),
              SearchBar(
                keyboardType: TextInputType.number,
                leading: const Icon(
                  Icons.search,
                  color: Colors.white,
                ),
                elevation: const MaterialStatePropertyAll(5),
                textStyle: const MaterialStatePropertyAll(
                    TextStyle(color: Colors.white)),
                backgroundColor:
                    MaterialStatePropertyAll(Colors.lightBlueAccent[200]),
                hintText: 'Search Product',
              ),
              const SizedBox(height: 14),
              Container(
                child: ListView.separated(
                    shrinkWrap: true,
                    physics: const  NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return ListTile(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => CallDetail(),));
                        },
                        selectedTileColor: Colors.lightBlueAccent[200],
                        tileColor: mydefaltbackground,
                        leading: CircleAvatar(
                          child: Text('Id'),
                          backgroundColor: Colors.blueAccent[100],
                        ),
                        title: Text('Customer Name'),
                        subtitle: Text('Status'),
                        trailing: Text('Date'),
                        onLongPress: () {},
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const Divider(
                        thickness: 1,
                        height: 1,
                      );
                    },
                    itemCount: 20),
              ),
            ],
          ),
        ),
      );

  }
}
