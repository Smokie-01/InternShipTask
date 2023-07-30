import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ListingCard extends StatelessWidget {
  final String imageUrl;
  final String price;
  final String deviceName;
  final String storage;
  final String condition;
  final String location;
  final String listingDate;

  ListingCard({
    required this.imageUrl,
    required this.price,
    required this.deviceName,
    required this.storage,
    required this.condition,
    required this.location,
    required this.listingDate,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        decoration: BoxDecoration(
          border: Border.all(),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16),
                    ),
                    child: CachedNetworkImage(
                      imageUrl: imageUrl,
                      height: 150,
                      fit: BoxFit.contain,
                      placeholder: (context, url) =>
                          Center(child: CircularProgressIndicator()),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    )),
              ],
            ),
            Container(
              padding: EdgeInsets.all(8),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(price),
                    SizedBox(height: 4),
                    Text(deviceName),
                    SizedBox(height: 4),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(storage),
                        Text(condition),
                      ],
                    ),
                    SizedBox(height: 4),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(location),
                        Text(listingDate),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      Positioned(
        right: -6,
        child: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.favorite_border,
            color: Colors.red,
            size: 30,
          ),
        ),
      ),
    ]);
  }
}