import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

class Notifications extends StatefulWidget {
  @override
  _Notifications createState() => _Notifications();
}

class _Notifications extends State<Notifications> {
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      width: 35,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(50.0)),
        color: Color(0xFFB74545),
      ),
      child: Align(
        alignment: Alignment.center,
        child: Text(
          "3",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
