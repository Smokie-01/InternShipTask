import 'package:flutter/material.dart';

class CatgoryWidget extends StatelessWidget {
  final String image;
  final String title;

  CatgoryWidget({
    required this.image,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size;
    return Container(
        height: mq.height * .12,
        width: mq.width * .22,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              image,
              height: 50,
              fit: BoxFit.contain,
            ),
            SizedBox(
              height: mq.height * .01,
            ),
            Text(
              title,
            )
          ],
        ));
  }
}