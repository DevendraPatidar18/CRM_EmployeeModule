import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart'as http;

class ProductAPIService
{
  Future addProduct(String token) async {

  }
  Future getProductList(String token)
  async {
    String getEnquiryApi = 'http://tutorials.codebetter.in:7088/users/servicelist';
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