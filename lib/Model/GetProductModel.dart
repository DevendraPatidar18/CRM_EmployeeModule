import 'dart:core';


class GetProductModel
{
 String? status;
 String? message;
 ProductList? productList;

 GetProductModel({this.status,this.message,this.productList});
 factory GetProductModel.fromJson(Map<String,dynamic> json){
  return GetProductModel(
   status: json['status'],
   productList: ProductList.fromJson(json['data'])
  );
 }
}
class ProductList{
 String? productName;
 String? productSpecification;
 String? productPrice;
 String? productType;
 int? productId;
 ProductList({this.productName,this.productSpecification,this.productPrice,this.productType,this.productId});
 factory ProductList.fromJson(Map<dynamic,dynamic> json){
  return ProductList(
  productId: json['item_no'],
  productName: json['item_no'],
  productSpecification: json['item_specification'],
  productPrice: json['item_price'],
  productType: json['item_type']
  );

 }
}


