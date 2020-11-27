import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:myapp/chat_icons.dart';

class Notifications extends StatefulWidget {
  @override
  _Notifications createState() => _Notifications();
}

class _Notifications extends State<Notifications> {
  Widget build(BuildContext context) {
    return Container(
        width: 30,
        height: 30,
        child: Stack(
          children: [
            Icon(Chat.vector, size: 25),
            Align(
                alignment: Alignment.topRight,
                child: Container(
                    alignment: Alignment.center,
                    height: 15,
                    width: 15,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                    ),
                    child: Text(
                      "3",
                      style: TextStyle(fontSize: 8, color: Colors.white),
                    )))
          ],
        ));
  }
}
