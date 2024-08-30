class GetEnquiryListModel
{
   bool? status;
   String? message;
   GetEnquiry? listModel;
   GetEnquiryListModel({this.status,this.message,this.listModel});
   factory GetEnquiryListModel.fromJson(Map<String,dynamic> json){
      return GetEnquiryListModel(
         status: json['status'],
         listModel: GetEnquiry.fromJson(json['data']),
      );
   }
}
class GetEnquiry
{
   int? enquiry_id;
   String? date;
   String? name;
   String? email;
   String? contact;
   String? status;
   String? source;
   String? reference;
   String? enquiry_for;
   int? emp_id;
   GetEnquiry({this.enquiry_id,this.date,this.name,this.email,this.contact,this.status,this.source,this.reference,this.enquiry_for,this.emp_id});
   factory GetEnquiry.fromJson(Map<dynamic,dynamic> json){
      return GetEnquiry(
          enquiry_id: json['enquiry_id'],
          date: json['date_time'],
          name:json['name'],
          email:json['email'],
          contact: json['contact'],
          status: json['status'],
          source: json['source'],
          reference:json['reference'],
          enquiry_for:json['enquiry_for'],
          emp_id: json['emp_id']
      );

   }
}
/*
class EnquiryListItem
{
   final List<GetEnquiry> enquiryListItem;
   EnquiryListItem({required this.enquiryListItem});
   factory EnquiryListItem.fromJson(Map<dynamic,dynamic> json)
   {
      var list = json['equiryListItem'] as List;
      List<GetEnquiry> itemList = list.map((enquiryItem) => GetEnquiry.fromJson(enquiryItem)).toList();
      return EnquiryListItem(enquiryListItem: itemList);
   }
}*/
