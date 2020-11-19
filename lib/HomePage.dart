import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'post.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
        child: Column(children: [
          Align(
              alignment: Alignment.centerRight,
              child: Text("3h ago",
                  style: TextStyle(color: Colors.grey, fontSize: 12))),
          Post(),
        ]));
  }
}
