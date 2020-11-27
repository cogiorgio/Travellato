import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:myapp/chat_icons.dart';
import 'SearchBar.dart';
import 'notifications.dart';

class HomeAppBar extends StatelessWidget with PreferredSizeWidget {
  @override
  final Size preferredSize;

  HomeAppBar({
    Key key,
  })  : preferredSize = Size.fromHeight(60.0),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Color(0xFFEEF5FD), width: 0.2),
        boxShadow: [
          BoxShadow(
            blurRadius: 2, // soften the shadow
            spreadRadius: 0.1,
            color: Color(0xFFEEF5FD),
            offset: Offset(0, 1),
          )
        ],
      ),
      child: Column(
        children: [
          Container(height: 0.05 * h),
          Row(children: [
            Container(
                alignment: Alignment.center,
                width: 0.333 * w,
                child: Icon(
                  Icons.add,
                  color: Color(0xFF548CCC),
                  size: 30,
                )),
            Container(
              width: 0.333 * w,
              alignment: Alignment.center,
              child: Text(
                "PeeP",
                style: TextStyle(fontSize: 30),
              ),
            ),
            Container(
              alignment: Alignment.center,
              width: 0.33 * w,
              child: Notifications(),
            ),
          ])
        ],
      ),
    );
  }
}
