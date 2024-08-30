class AddRequest{
  String? name;
  String? email;
  String? status;
  String? contactNumber;
  String? source;
  String? reference;
  String? enquired_For;
  AddRequest({this.name,this.email,this.status,this.contactNumber,this.source,this.reference,this.enquired_For});
  Map<String,dynamic> toJson(){
    Map<String,dynamic> mapping = {
      'name':name,
      'email': email,
      'contact':contactNumber,
      'status' :status,
      'source':source,
      'reference':reference,
      'enquiry_for':enquired_For
    };
    return mapping;
  }

}
class AddResponse{
  String ? message;
  bool ? status;
  AddResponse({this.message,this.status});
  factory AddResponse.fromJSON(Map<String,dynamic> map)
  {
    return AddResponse(
      message: map["msg"] != null ? map["msg"] : "",
    );
  }

}