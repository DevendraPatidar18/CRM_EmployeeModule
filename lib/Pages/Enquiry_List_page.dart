import 'package:crm/Model/GetEnquiryModel.dart';
import 'package:crm/Pages/Enquiry_Detail_page.dart';
import 'package:crm/Services/EnquiryAPIService.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher_string.dart';

class Enquiey_List extends StatefulWidget {
  const Enquiey_List({super.key});

  @override
  State<Enquiey_List> createState() => _Enquiey_ListState();
}

class _Enquiey_ListState extends State<Enquiey_List> {
  List<GetEnquiry> dataList = <GetEnquiry>[];
  int? dataListLength;
  String? token;
  List<GetEnquiry> searchList= [];
  TextEditingController searchController = TextEditingController();
  searchQuery(String value){
    setState(() {
      searchList = dataList.where((element) => element.name!.toLowerCase().contains(value.toLowerCase())).toList();
    });
  }
  @override
  void initState() {
    super.initState();
    getDataFromSharedPrefrence();
  }

  void getDataFromSharedPrefrence() async {
    SharedPreferences s = await SharedPreferences.getInstance();
    token = s.getString('token');
    getAllUsersData(token!);
    /*getEnquiry(token!);*/
  }

  /*void getEnquiry(String token) {
    EnquiryAPIService service = EnquiryAPIService();
    service.getEnquirys(token!);
    getAllUsersData(token!);
  }*/

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
      width: screenWidth,
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/drawable/screenbackground.png'),
              fit: BoxFit.fill)),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 8),
            SearchBar(
              keyboardType: TextInputType.text,
              leading: const Icon(
                Icons.search,
                color: Colors.white,
              ),
              elevation: const MaterialStatePropertyAll(5),
              textStyle: const MaterialStatePropertyAll(
                  TextStyle(color: Colors.white)),
              backgroundColor:
                  MaterialStatePropertyAll(Colors.lightBlueAccent[200]),
              hintText: 'Search Enquiry',
              controller: searchController,
              onChanged: (value) => searchQuery(value),
            ),
            SizedBox(height: 14),
            searchController.text.isNotEmpty&& searchList.isEmpty?
                Center(
                  child: Column(

                    children: [
                      SizedBox(height: 50),
                      Text("Search Not Found",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
                      SizedBox(height: 10),
                      Icon(Icons.search_off,color: Colors.blue[400],size: 130
                        )
                    ],
                  ),
                )
            :
            Container(
              child: ListView.separated(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return ListTile(
                      selectedTileColor: Colors.lightBlueAccent[200],
                      leading: CircleAvatar(

                        child: Text(searchController.text.isNotEmpty?
                        searchList[index].enquiry_id.toString():dataList[index].enquiry_id.toString()),
                        backgroundColor: Colors.blueAccent[100],
                      ),
                      textColor: Colors.black,
                      title: Text(searchController.text.isNotEmpty? searchList[index].name!:dataList[index].name!),
                      subtitle: Text(searchController.text.isNotEmpty? searchList[index].status!:dataList[index].status!),
                      trailing: Container(
                          //Text(searchController.text.isNotEmpty? searchList[index].date!:dataList[index].date! ),
                          child:InkWell(
                            onTap: (){
                              launchUrlString("tel://${searchController.text.isNotEmpty? searchList[index].contact! : dataList[index].contact}");
                            },
                              child: Icon(Icons.call,color: Colors.blueAccent[200],))

                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => EnquiryDetail(enquiryData: dataList[index]),
                            ));
                      },
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const Divider(
                      thickness: 1,
                      height: 1,
                    );
                  },
                  itemCount: searchController.text.isNotEmpty?   searchList.length : dataList.length),
            ),
          ],
        ),
      ),
    );
  }

  getAllUsersData(String token) {
    print('Get token: $token');
    EnquiryAPIService service = EnquiryAPIService();
    service.getEnquirys(token).then((value) => {
          if (value != null)
            {
              dataListLength = value['data'].length,
              // dataList = <GetEnquiry>[],
              value['data'].forEach((userData) {
                setState(() {
                  var enquiryData = GetEnquiry(
                    enquiry_id: userData['enquiry_id'],
                    name: userData['name'],
                    status: userData['status'],
                    date: userData['date_time'],
                    email: userData['email'],
                    contact: userData['contact'],
                    source: userData['source'],
                    reference: userData['reference'],
                    enquiry_for: userData['enquiry_for'],
                    emp_id: userData['emp_id']
                  );
                  print('List Data is :$enquiryData');
                  dataList.add(enquiryData);
                });
              })
            }
          else
            {print('fatching Faild')}
        });
  }
}
