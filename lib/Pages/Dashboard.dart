import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {


  List<Text> grildTitle = [

    const Text('Make Call',style: TextStyle(color: Colors.white, fontSize: 16),),
    const Text('Make Email',style: TextStyle(color: Colors.white, fontSize: 16),),
    const Text('Messages',style: TextStyle(color: Colors.white, fontSize: 16),),
  ];
  List<Widget> grildIcon = [
    const Icon(Icons.call,size: 30,color: Colors.white,),
    const Icon(Icons.email,size: 30,color: Colors.white,),
    const Icon(Icons.message_outlined,size: 30,color: Colors.white,),

  ];
  List imageList = [
    {"id": 1, "imagePath": 'assets/Slider_images/img.png'},
    {"id": 2, "imagePath": 'assets/Slider_images/task.png'},
    {"id": 3, "imagePath": 'assets/Slider_images/events.png'},
    {"id": 4, "imagePath": 'assets/Slider_images/new_product.png'},
  ];

  CarouselController carouselController = CarouselController();

  var currentIndex = 0;


  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Container(
      height: screenHeight,
      width: screenWidth,
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/drawable/screenbackground.png'),
              fit: BoxFit.fill)),


          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const SizedBox(height: 10),
              SearchBar(
                keyboardType: TextInputType.number,
                leading: const Icon(
                  Icons.search,
                  color: Colors.white,
          
                ),
                elevation: const MaterialStatePropertyAll(5),
                textStyle: const MaterialStatePropertyAll(
                    TextStyle(color: Colors.white)),
                backgroundColor: MaterialStatePropertyAll(Colors.blue[400]),
                hintText: 'Search Enquiry',
          
          
              ),
              const SizedBox(height: 10),
              // horizontalScrollView(context),
              imageSlider(context,screenWidth),
              Container(
                alignment: Alignment.center,
                width: screenWidth/1.1,
                height: screenHeight/6,
                child: GridView.count(
                  childAspectRatio: 1.025,
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.all(10),
                  crossAxisCount: 1,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  children: List.generate(3, (index) {
                    return Card(
                      elevation: 10,
                      color: Colors.blue[400],
                      child: InkWell(
                        onTap: () {
                        switch(index) {
                          case 0 : launchUrlString("tel://");break;
                          case 1:launchUrlString("mailto:");break;
                          case 2:launchUrlString("sms:");break;
          
                        }
                        },
          
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const SizedBox(
                              height: 10,
                            ),
                            grildIcon[index],
                            grildTitle[index],
                          ]),
                      ),
                    );
                  }),
                ),
              ),
          
              Container(
                  alignment: Alignment.topLeft,
                  padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                  child: Text('Recent',
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.blue[400],
                        fontWeight: FontWeight.bold,
                      ))),
              const SizedBox(height: 10),
          
          
                 Container(
                   height: screenHeight*0.3,
                   width: screenWidth*0.95,
                   child: ListView.separated(
                        itemCount: 2,
          
                        itemBuilder: (context, index) {
                          return ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            child: Card(
                              elevation: 10,
                              color: Colors.white,
                              child: ListTile(
                                tileColor: Colors.blue[400],
                                title: Text("Create new Enquiry",style: TextStyle(fontSize: 20,color: Colors.white),),
                                trailing: Icon(Icons.add,color: Colors.white,),
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return const SizedBox(height: 5);
                        }),
                 )
            ],
          ),


    );
  }
  Widget imageSlider(BuildContext context,width) {
    return Stack(
      children: [
        CarouselSlider(
          items: imageList
              .map((item) => Container(
                  alignment: Alignment.center,
                  width: width/1.1,
                  height: 200,
                  decoration:  BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                    image: DecorationImage(
                        image: AssetImage(item['imagePath']),
                        fit: BoxFit.fill),
                  ),
              child: Text(
                '',
                style: TextStyle(
                    fontSize: 32,
                    color: Colors.grey[500],
                    fontWeight: FontWeight.bold),
              ),
          ))
              .toList(),
          carouselController: carouselController,
          options: CarouselOptions(
              scrollPhysics: const BouncingScrollPhysics(),
              autoPlay: true,
              aspectRatio: 2,
              viewportFraction: 1,
              onPageChanged: (index, reason) {
                setState(() {
                  currentIndex = index;
                });
              }),
        ),
        Positioned(
            bottom: 8.0,
            left: 0,
            right: 0,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: imageList.asMap().entries.map((entry) {
                  return GestureDetector(
                    onTap: () {
                      carouselController.animateToPage(entry.key);
                    },
                    child: Container(
                      width: currentIndex == entry.key ? 15 : 7,
                      height: 7.0,
                      margin: const EdgeInsets.symmetric(horizontal: 3),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: currentIndex == entry.key
                            ? Colors.indigo
                            : Colors.teal,
                      ),
                    ),
                  );
                }).toList()))
      ],
    );
  }
}
