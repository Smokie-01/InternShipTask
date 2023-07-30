import 'package:flutter/material.dart';
import 'package:shop_app/view/notification_screen.dart';

class customAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double height;
  final double width;

  const customAppBar({
    required this.height,
    required this.width,
  });
  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);

  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: Colors.indigo,
        bottom: PreferredSize(
          preferredSize: Size(width, 10),
          child: TextFormField(
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                prefix: Icon(
                  Icons.search,
                  color: Colors.white,
                ),
                hintText: 'Search with make and model',
                hintStyle: TextStyle(color: Colors.white),
              )),
        ),
        leading: const Icon(Icons.more_vert),
        automaticallyImplyLeading: false,
        actions: [
          Row(
            children: [
              Text("India"),
              Icon(
                Icons.location_pin,
                size: 30,
              )
            ],
          ),
          Stack(
            children: [
              IconButton(
                icon: Icon(Icons.notifications),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => NotificationScreen()));
                },
              ),
              Positioned(
                  right: 10,
                  child: Container(
                    padding: EdgeInsets.all(2),
                    decoration: new BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    constraints: BoxConstraints(
                      minWidth: 14,
                      minHeight: 14,
                    ),
                    child: Center(
                      child: Text('3'),
                    ),
                  ))
            ],
          )
        ]);
  }
}
