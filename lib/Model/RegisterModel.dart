class RegisterRequest{
  String? name;
  String? email;
  String? pass;
  String? contactNumber;
  String? role;
  String? date;
  RegisterRequest(String? name,String? email,String? pass,String? contactNumber,String? role,String? date){
    this.name = name;
    this.email = email;
    this.pass = pass;
    this.contactNumber = contactNumber;
    this.role = role;
    this.date = date;
  }
  Map<String,dynamic> toJson(){
    Map<String,dynamic> mapping = {
      "name":name,
      "role":role,
      "email":email,
      "password":pass,
      "contact": contactNumber,
      "joining_date":date
    };
    return mapping;
  }

}
class RegisterResponse{
  String ? message;
  bool ? status;

  RegisterResponse({this.message,this.status});

  factory RegisterResponse.fromJSON(Map<String,dynamic> map)
  {
    return RegisterResponse(
      message: map["message"] != null ? map["message"] : "",
      status: map["status"] != null ? map["status"] : "",
    );
  }

}