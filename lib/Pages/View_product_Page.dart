import 'package:crm/Model/GetProductModel.dart';
import 'package:crm/Pages/Product_Detail.dart';
import 'package:crm/Services/ProductAPIService.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Constants/constants.dart';

class View_product extends StatefulWidget {
  const View_product({super.key});

  @override
  State<View_product> createState() => _View_productState();
}

class _View_productState extends State<View_product> {
  int? dataListLength;
  List<ProductList> dataList = <ProductList>[];
  String? token;
  @override
  void initState() {
    super.initState();
    getDataFromSharedPrefrence();
  }
  void getDataFromSharedPrefrence() async {
    SharedPreferences s = await SharedPreferences.getInstance();
    token = s.getString('token');
    getAllProductData(token!);
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/drawable/screenbackground.png'),
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
                textStyle:
                const MaterialStatePropertyAll(TextStyle(color: Colors.white)),
                backgroundColor: MaterialStatePropertyAll(
                    Colors.lightBlueAccent[200]),
                hintText: 'Search Product',
              ),
              SizedBox(height: 14),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(30))
                ),
                child: ListView.separated(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: dataList.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (
                            context) => ProductDetail()));
                      },
                      tileColor: mydefaltbackground,
                      leading: CircleAvatar(
                        backgroundColor: Colors.blueAccent[100],
                        child: Text(dataList[index].productId.toString()),
                      ),
                      title: Text(dataList[index].productName!),
                      subtitle: Text(dataList[index].productType!),
                      trailing:  Text(dataList[index].productPrice!),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const Divider(
                      thickness: 1,
                      height: 1,
                    );
                  },
                ),
              ),

            ],
          )

      ),
    );
  }

  Widget avilableProduct(BuildContext context) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: 8,
      itemBuilder: (context, index) {
        return Container(
            height: 70,
            width: 200,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                color: Colors.blue[400]
            ),

            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,

              children: [
                Text('Product Name', style: TextStyle(color: Colors.white),),
                Text('Number', style: TextStyle(color: Colors.white))
              ],
            )
        );
      },
      separatorBuilder: (context, index) {
        return SizedBox(width: 10);
      },

    );
  }

  getAllProductData(String token){
    ProductAPIService productAPIService = ProductAPIService();
    productAPIService.getProductList(token).then((value) => {
      if(value != null){
        dataListLength = value['data'].length,
        value['data'].forEach((productData) {
          setState(() {
            var productDetail = ProductList(
                productId: productData['item_no'],
                productName: productData['item_name'],
                productSpecification: productData['item_specification'],
                productPrice: productData['item_price'].toString(),
                productType: productData['item_type']
            );
            print('List Data is :$productDetail');
            dataList.add(productDetail);
          });
        })
      }
    });

  }
}
