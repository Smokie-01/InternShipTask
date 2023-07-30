import 'dart:convert';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/widgets/catagoryWidget.dart';
import 'package:shop_app/widgets/customAppBar.dart';
import 'package:http/http.dart' as http;
import 'package:shop_app/widgets/customBottomSheet.dart';
import 'package:shop_app/widgets/listingCardWidget.dart';

import '../constants/constants.dart';
import '../model/products.dart';

List<Product> productsList = [];

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();
  List<Product> productsList = [];
  int pageNo = 1;

  @override
  void initState() {
    super.initState();
    getData();
    _scrollController.addListener(() {
      _getDataAndUpdateList();
    });
  }
Future<List<Product>> getData() async {
    try {
      String url =
          "https://dev2be.oruphones.com/api/v1/global/assignment/getListings?page=$pageNo&limit=10";
      final response = await http.get(Uri.parse(url));
      var data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        List<dynamic> listingsData = data["listings"];
        List<Product> listings = listingsData.map((listingData) {
          var defaultImage = listingData['images'];
          return Product(
            imageUrl: defaultImage[0]['fullImage'],
            price: listingData['listingNumPrice'].toString(),
            deviceName: listingData['model'],
            storage: listingData['deviceStorage'],
            condition: listingData['deviceCondition'],
            location: listingData['listingLocation'],
            listingDate: listingData['listingDate'],
          );
        }).toList();
        setState(() {
          productsList.addAll(listings);
        });
       
      }
    } on Exception catch (e) {
      print(e);
    }
    return productsList;
  }
  

 _getDataAndUpdateList() async {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent) {
          setState(() {
          pageNo++;
          });
      List<Product> newProducts = await getData();
       productsList.addAll(newProducts);
 
    }
    return productsList;
  }

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
            preferredSize: Size(mq.width, mq.height * .1),
            child: customAppBar(
              height: mq.height * .01,
              width: mq.width,
            )),
        body: SingleChildScrollView(
          controller: _scrollController,
          physics: const BouncingScrollPhysics(),
          child: Container(
            padding: const EdgeInsets.all(4),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Buy Products',
                  style: TextStyle(fontSize: 16),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: mq.width * .02),
                  height: mq.height * .10,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        height: mq.height * .08,
                        width: mq.width * .2,
                        child: Image.asset(
                          "images/apple.png",
                          fit: BoxFit.contain,
                        ),
                      ),
                      SizedBox(
                        height: mq.height * .08,
                        width: mq.width * .2,
                        child: Image.asset(
                          "images/mi.jpg",
                          fit: BoxFit.contain,
                        ),
                      ),
                      SizedBox(
                        height: mq.height * .08,
                        width: mq.width * .2,
                        child: Image.asset(
                          "images/Samsung.jpg",
                          fit: BoxFit.contain,
                        ),
                      ),
                      SizedBox(
                        height: mq.height * .08,
                        width: mq.width * .2,
                        child: Image.asset(
                          "images/Vivo.png",
                          fit: BoxFit.contain,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: mq.height * .01,
                ),
                CarouselSlider(
                    items: craouselPicture.map((i) {
                      return Builder(builder: ((context) {
                        return Container(
                          width: mq.width,
                          margin: const EdgeInsets.symmetric(horizontal: 5),
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(
                                  "images/carasoul_Images/$i",
                                ),
                                fit: BoxFit.cover),
                            color: Colors.amber,
                          ),
                        );
                      }));
                    }).toList(),
                    options: CarouselOptions(
                        height: mq.height * .23,
                        autoPlay: true,
                        viewportFraction: 1,
                        enableInfiniteScroll: true)),
                SizedBox(
                  height: mq.height * .01,
                ),
                const Text('Shop By'),
                SizedBox(
                  height: mq.height * .01,
                ),
                Container(
                  padding: const EdgeInsets.all(4),
                  height: mq.height * .18,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CatgoryWidget(
                        image: "images/catogory/bestSelling.jpg",
                        title: "Best Selling",
                      ),
                      CatgoryWidget(
                        image: "images/catogory/starImage.jpg",
                        title: "Like New Condition",
                      ),
                      CatgoryWidget(
                        image: "images/catogory/verified.png",
                        title: "Verified Only",
                      ),
                      CatgoryWidget(
                        image: "images/catogory/warranty.jpg",
                        title: "Phones with warranty ",
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: mq.height * .01,
                ),
                Row(children: [
                  RichText(
                    text: const TextSpan(
                      children: [
                        TextSpan(
                            text: "Best deals Near You ",
                            style: TextStyle(color: Colors.black)),
                        TextSpan(
                            text: " India",
                            style: TextStyle(
                                color: Colors.amber,
                                fontSize: 20,
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                  TextButton.icon(
                      onPressed: () {
                       CustomClass.customShowbottomsheet(context);
                      },
                      icon: Icon(Icons.sort),
                      label: Text("Sort"))
                ]),
                Padding(
                    padding: EdgeInsets.all(10),
                    child: FutureBuilder(
                      future: getData(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return GridView.builder(
                            scrollDirection: Axis.vertical,
                            physics: const BouncingScrollPhysics(),
                            shrinkWrap: true,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisSpacing: 12,
                                    mainAxisSpacing: 12,
                                    crossAxisCount: 2,
                                    mainAxisExtent: 260),
                            itemCount: productsList.length,
                            itemBuilder: ((context, index) {
                              return ListingCard(
                                condition: productsList[index].condition,
                                deviceName: productsList[index].deviceName,
                                imageUrl: productsList[index].imageUrl,
                                listingDate: productsList[index].listingDate,
                                location: productsList[index].location,
                                price: productsList[index].price,
                                storage: productsList[index].storage,
                              );
                            }),
                          );
                        } else {
                          return Center(child: CircularProgressIndicator());
                        }
                      },
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}



filterCatogory(
    {required String title,
    required BuildContext context,
    required int listLength,
    required List<String> listName}) {
  final mq = MediaQuery.of(context).size;
  return Container(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 20),
          textAlign: TextAlign.start,
        ),
        Constants.commonSpace(mq.height * .01, 0),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(
              listLength,
              (index) {
                return Chip(
                    label:
                        Text(listName[index], style: TextStyle(fontSize: 18)));
              },
            ),
          ),
        ),
      ],
    ),
  );
}




