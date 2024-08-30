import 'dart:convert';
import 'package:crm/Model/AddEnquiryModel.dart';
import 'package:crm/Model/GetEnquiryModel.dart';
import 'package:http/http.dart' as http;
class EnquiryAPIService
{
  Future<AddResponse> enquiryRegister(AddRequest enquiry,String token)
  async {
    String addEnquiryApi = 'http://tutorials.codebetter.in:7088/users/enquiry';
    final response = await http.post(Uri.parse(addEnquiryApi),
        headers: {'Authorization':'Bearer $token'},
        body: enquiry.toJson()
    );
    print("Response Object is : ${response}");
    print("Response Body is : ${response.body}");
    var data = jsonDecode(response.body);
    print("Data is : ${data}");
    if(data["status"]){
      print('Success Response is : ${data}');
      return AddResponse.fromJSON(data);
    }
    else{
      print('Register Faild ...${data}');
      throw Exception("Faild");
    }
  }
  Future getEnquirys(String token)
  async {
    String getEnquiryApi = 'http://tutorials.codebetter.in:7088/users/enquirylist';
    final response = await http.get(Uri.parse(getEnquiryApi),
      headers: {'Authorization':'Bearer $token'},
    );
    print("Enquiry List Response Object is : ${response}");
    print("Enquiry List Response Body is : ${response.body}");

    var respData = json.decode(response.body);

   if(respData['status'] == true){
     return jsonDecode(response.body);
   }
   else{
     throw('Somthing worng');
   }
  }
}
