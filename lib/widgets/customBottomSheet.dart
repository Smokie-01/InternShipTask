import 'package:flutter/material.dart';
import 'package:shop_app/constants/constants.dart';
import 'package:shop_app/view/homePage.dart';
class CustomClass{
static customShowbottomsheet(BuildContext context) {
  final mq = MediaQuery.of(context).size;
  return showModalBottomSheet(
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
      ),
      context: context,
      builder: (BuildContext context) {
        return Container(
            child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text("Filters"), Text("Clear Filters")],
              ),
              Constants.commonSpace(mq.height * .02, 0),
              filterCatogory(
                title: "Brands",
                context: context,
                listLength: mobileBrands.length,
                listName: mobileBrands,
              ),
              filterCatogory(
                title: "Ram",
                context: context,
                listLength: deviceRam.length,
                listName: deviceRam,
              ),
              filterCatogory(
                title: "Storage",
                context: context,
                listLength: deviceStorage.length,
                listName: deviceStorage,
              ),
              filterCatogory(
                title: "Conditions",
                context: context,
                listLength: deviceCondition.length,
                listName: deviceCondition,
              ),
              filterCatogory(
                title: "Warranty",
                context: context,
                listLength: deviceWarranty.length,
                listName: deviceWarranty,
              ),
              filterCatogory(
                title: "verification",
                context: context,
                listLength: deviceVerification.length,
                listName: deviceVerification,
              ),
              Constants.commonSpace(mq.height * .01, 0),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Price",
                      style: TextStyle(fontSize: 20),
                    ),
                    Constants.commonSpace(mq.height * .01, 0),
                    Row(
                      children: [
                        Text("Min"),
                        Constants.commonSpace(0, mq.width * .01),
                        Container(
                          height: 30,
                          width: 100,
                          child: TextField(
                            decoration:
                                InputDecoration(border: OutlineInputBorder()),
                          ),
                        ),
                        Constants.commonSpace(0, 50),
                        Text("Max"),
                        Constants.commonSpace(0, mq.width * .01),
                        Container(
                          height: 30,
                          width: 100,
                          child: TextField(
                            decoration:
                                InputDecoration(border: OutlineInputBorder()),
                          ),
                        )
                      ],
                    ),
                    Constants.commonSpace(mq.height * .01, 0),
                    Slider(
                        activeColor: Colors.indigo,
                        value: 1.0,
                        onChanged: (number) {}),
                    Constants.commonSpace(mq.height * .01, 0),
                    Center(child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.indigo, minimumSize: Size(60, 40)),
                      child: Text("Apply")))
                  ],
                ),
              ),
            ],
          ),
        ));
      });
}
}