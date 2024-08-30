import 'package:flutter/material.dart';

import 'Enquiry_Detail_page.dart';
class Assigned_Enquiry extends StatefulWidget {
  const Assigned_Enquiry({super.key});

  @override
  State<Assigned_Enquiry> createState() => _Assigned_EnquiryState();
}

class _Assigned_EnquiryState extends State<Assigned_Enquiry> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/drawable/screenbackground.png'),
              fit: BoxFit.fill)
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 8),
            SearchBar(
              keyboardType: TextInputType.number,
              leading: const Icon(
                Icons.search,
                color: Colors.white,
              ),
              elevation: const MaterialStatePropertyAll(5),
              textStyle: const MaterialStatePropertyAll(
                  TextStyle(color: Colors.white)),
              backgroundColor: MaterialStatePropertyAll(Colors.lightBlueAccent[200]),
              hintText: 'Search Enquiry',
            ),
            SizedBox(height: 14),
            Container(
              child: ListView.separated(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return ListTile(
                      selectedTileColor: Colors.lightBlueAccent[200],
                      leading: CircleAvatar(
                        child: Text('Id'),
                        backgroundColor: Colors.blueAccent[100],
                      ),
                      textColor: Colors.black,
                      title: Text('Customer Name'),
                      subtitle: Text('Status'),
                      trailing: Text('Date'),
                      onTap: (){
                        //Navigator.push(context, MaterialPageRoute(builder: (context) => EnquiryDetail(),));
                      },
                    );
                  },
                  separatorBuilder: (context, index) {
                    return Divider(
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
