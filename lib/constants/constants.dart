import 'package:flutter/material.dart';

class Constants{

static commonSpace( double? height , double? widht){
  return SizedBox(
    height: height??0,
    width: widht??0,
  );

}
}

List<String> craouselPicture =[
'1.jpg',
'2.png',
'3.jpg',
];

List<String> mobileBrands = ['All', "Apple", "Samsung", "Mi", "Vivo", "Iqoo","Oppo", "Motorola"];
List<String> deviceRam = ["All","1Gb","2GB","3GB","4GB","6GB","8GB", "12GB"];
List<String> deviceStorage = ["All","32GB","64GB","128GB","256GB"];
List<String> deviceCondition = ["All", "New", "Good", "Excelent" ,];
List<String> deviceWarranty = ["All","Brand Warranty", "Seller warranty"];
List<String> deviceVerification =["All", "Verified"];







