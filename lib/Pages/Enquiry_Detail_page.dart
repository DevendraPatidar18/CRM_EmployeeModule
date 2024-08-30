import 'dart:ffi';

import 'package:crm/Model/GetEnquiryModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class EnquiryDetail extends StatefulWidget {
  final GetEnquiry? enquiryData;
   EnquiryDetail({
    super.key,
    required this.enquiryData
  });

  @override
  State<EnquiryDetail> createState() => _EnquiryDetailState();
}

List<TextEditingController> textEditingControllers =
    List.generate(8, (index) => TextEditingController());

bool _isEditingText = false;
List<String> leadingDetails = [
  'Name',
  'Email',
  'Contact',
  'Status',
  'Source',
  'Reference',
  'Enquiry for',
  'Employee Id'
];
List<dynamic> dataList = [];
List<String> detailTitle = [
  'Your Name',
  'Youremail@email.com',
  '9854******',
  'Enquiry Status',
  'Source of Contact',
  'Refer by',
  'Product',
  'Employee Id'
];
class _EnquiryDetailState extends State<EnquiryDetail> {
  int? id;
  String? name;
  String? email;
  String? contactNumber;
  String? date;
  String? source;
  String? refrence;
  String? enquiry_for;
  int? emp_id;

  @override
  void initState() {
    super.initState();
    setState(() {
      dataList.clear();
      getListFromData();
    });


  }
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery
        .of(context)
        .size
        .width;
    final screenHeight = MediaQuery
        .of(context)
        .size
        .height;
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          'Enquiry Detail',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue[400],
      ),
      body: Container(
        height: screenHeight,
        width: screenWidth,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/drawable/screenbackground.png'),
            fit: BoxFit.fill,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  height: screenHeight*0.8,
                  width: 600,
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 20, left: 10, right: 10, bottom: 20),
                    child: ListView.separated(
                        itemBuilder: (context, index) {
                          return ListTile(
                            iconColor: Colors.white,
                            leading: SizedBox(
                                height: 20,
                                width: 60,
                                child: Text(
                                  leadingDetails[index],
                                  style: TextStyle(fontWeight: FontWeight.w700),
                                )),
                            title: _isEditingText == true
                                ? TextField(
                              controller: textEditingControllers[index],
                              decoration: InputDecoration(
                                  hintText: detailTitle[index]),
                            )
                                : Text(
                              dataList[index],
                              //detailTitle[index],
                              style: const TextStyle(
                                  decoration: TextDecoration.underline),
                            ),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return const SizedBox(height: 15);
                        },
                        itemCount: 8),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(width: 1),
                    TextButton(
                        onPressed: () {
                          _isEditingText = true;
                          setState(() {});
                        },
                        child: const Text('Edite')),
                    const SizedBox(width: 100),
                    TextButton(
                        onPressed: () {
                          setState(() {
                            for (int i = 0; i < detailTitle.length; i++) {
                              detailTitle[i] = textEditingControllers[i].text;
                            }
                          });
                          _isEditingText = false;
                        },
                        child: const Text('Save Changes')),
                    TextButton(
                        onPressed: () {
                          setState(() {});
                          _isEditingText = false;
                        },
                        child: const Text('Done')),
                    const SizedBox(width: 1),
                  ],
                ),

              ]),
        ),
      ),
    );
  }

   getListFromData() {

    dataList.add(widget.enquiryData?.name);
    dataList.add(widget.enquiryData?.email.toString());
    dataList.add(widget.enquiryData?.contact.toString());
    dataList.add(widget.enquiryData?.status.toString());
    dataList.add(widget.enquiryData?.source.toString());
    dataList.add(widget.enquiryData?.reference.toString());
    dataList.add(widget.enquiryData?.enquiry_for.toString());
    dataList.add(widget.enquiryData?.emp_id.toString());

    }

}