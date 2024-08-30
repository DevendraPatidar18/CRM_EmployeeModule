import 'package:flutter/material.dart';

class CallDetail extends StatefulWidget {
  const CallDetail({super.key});

  @override
  State<CallDetail> createState() => _CallDetailState();
}

List<TextEditingController> textEditingControllers =
    List.generate(6, (index) => TextEditingController());

bool _isEditingText = false;
List<String> leadingDetails = [
  'Enquiry_Id',
  'Employee_Id',
  'Date_Time',
  'Discussion',
  'Result',
  'Feedback',
];
List<String> detailTitle = ['', '', '', '', '', ''];

class _CallDetailState extends State<CallDetail> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
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
                    height: 700,
                    width: 600,
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 20, left: 10, right: 10, bottom: 20),
                      child: ListView.separated(
                        itemCount: 6,
                        itemBuilder: (context, index) {
                          return ListTile(
                            iconColor: Colors.white,
                            leading: SizedBox(
                                height: 20,
                                width: 70,
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
                                    detailTitle[index],
                                    style: const TextStyle(
                                        decoration: TextDecoration.underline),
                                  ),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return const SizedBox(height: 15);
                        },
                      ),
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
                  SizedBox(height: 15),
                ]),
          ),
        ));
  }
}
