import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  Function callback;
  Login(this.callback);
  @override
  @override
  Widget build(BuildContext context) {
    // This app is designed only to work vertically, so we limit
    // orientations to portrait up and down.
    final double h = MediaQuery.of(context).size.height;
    final double w = MediaQuery.of(context).size.width;
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Container(
        height: 0.22 * h,
      ),
      Container(
        alignment: Alignment.center,
        padding: EdgeInsets.only(top: 0.0 * h),
        child: Container(
            padding: EdgeInsets.all(30),
            height: 220,
            width: 220,
            decoration: BoxDecoration(
                color: Color(0xFFEEF5FD),
                borderRadius: BorderRadius.all(Radius.circular(300))),
            child: ClipRRect(
                child: Image(image: AssetImage('graphics/COFFEE.png')))),
      ),
      Container(
        height: 0.02 * h,
      ),
      Container(
        height: 0.06 * h,
        alignment: Alignment.center,
        child: RaisedButton(
          onPressed: () {},
          disabledColor: Color(0xFFEEF5FD),
          highlightColor: Color(0xFFEEF5FD),
          splashColor: Color(0xFF548CCC),
          elevation: 1,
          disabledElevation: 1.0,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(50))),
          color: Color(0xFF9DC3EE),
          child: Container(
              alignment: Alignment.center,
              width: 150,
              child: Text("Sign In", style: TextStyle(color: Colors.white))),
        ),
      ),
      Container(
        height: 0.02 * h,
      ),
      Container(
        height: 0.06 * h,
        alignment: Alignment.center,
        child: RaisedButton(
            onPressed: () {
              this.callback();
            },
            disabledColor: Color(0xFFEEF5FD),
            highlightColor: Color(0xFFEEF5FD),
            splashColor: Color(0xFF548CCC),
            elevation: 1,
            disabledElevation: 1.0,
            shape: RoundedRectangleBorder(
                side: BorderSide(color: Color(0xFF548CCC), width: 0.6),
                borderRadius: BorderRadius.all(Radius.circular(50))),
            color: Color(0xFFEEF5FD),
            child: Container(
                alignment: Alignment.center,
                width: 150,
                child: Text(
                  "Log In",
                  style: TextStyle(color: Color(0xFF548CCC)),
                ))),
      ),
      Container(
        height: 0.02 * h,
      ),
      Container(
        alignment: Alignment.center,
        height: 0.03 * h,
        child: Text(
          "forgot your password?",
          style: TextStyle(color: Colors.grey),
        ),
      ),
    ]);
  }
}
