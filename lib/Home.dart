import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:myapp/circle_icons.dart';
import 'package:myapp/my_flutter_app_icons.dart';
import 'package:myapp/note_icons.dart';
import 'HomeAppBar.dart';
import 'SearchBar.dart';
import 'notifications.dart';
import 'BottomAppBar.dart';
import 'ChatAppBar.dart';
import 'ProfileAppBar.dart';
import 'HomePage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // This app is designed only to work vertically, so we limit
    // orientations to portrait up and down.
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    //SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.top]);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark));
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
      ),
      home: CupertinoHomePage(),
    );
  }
}

class CupertinoHomePage extends StatefulWidget {
  @override
  _CupertinoHomePage createState() => _CupertinoHomePage();
}

class _CupertinoHomePage extends State<CupertinoHomePage>
    with TickerProviderStateMixin {
  var selectedIndex = 1;
  Animation<double> animation;
  AnimationController controller;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
        duration: const Duration(milliseconds: 800), vsync: this);
    animation = Tween(begin: 0.0, end: 0.0).animate(new CurvedAnimation(
        parent: controller,
        curve: Curves.easeInOutBack,
        reverseCurve: Curves.easeOut))
      ..addListener(() {
        setState(() {
          // The state that has changed here is the animation object’s value.
        });
      });
  }

//SEI SCARSO A PROGRAMMARE <3 concordo
  double v = 0;
  double r = 0;
  double fall = 0;
  @override
  Widget build(BuildContext context) {
    final double h = MediaQuery.of(context).size.height;
    final double w = MediaQuery.of(context).size.width;
    print(MaterialLocalizations.of(context));
    controller.forward();
    return Scaffold(
        appBar: HomeAppBar(),
        body: Stack(children: [
          Container(),
          GestureDetector(
              onVerticalDragStart: (d) {
                fall = 0;
              },
              onVerticalDragUpdate: (d) {
                if (v == 0) {
                  v = d.localPosition.dy;
                  r = d.localPosition.dy;
                } else
                  r = d.localPosition.dy;
                print(v);
                setState(() {});
              },
              onVerticalDragEnd: (d) {
                if (v - r < ((h - 60) * 0.5) / 3) {
                  controller.reset();
                  fall = 1;
                  animation = Tween(begin: r - v, end: 0.0).animate(
                      new CurvedAnimation(
                          parent: controller,
                          curve: Curves.easeOutBack,
                          reverseCurve: Curves.easeOut))
                    ..addListener(() {
                      setState(() {
                        // The state that has changed here is the animation object’s value.
                      });
                    });
                } else {
                  controller.reset();
                  fall = 1;
                  animation = Tween(begin: r - v, end: -(h - 60) * 0.40)
                      .animate(new CurvedAnimation(
                          parent: controller,
                          curve: Curves.easeOutBack,
                          reverseCurve: Curves.easeOut))
                        ..addListener(() {
                          setState(() {
                            // The state that has changed here is the animation object’s value.
                          });
                        });
                }
              },
              child: Transform.translate(
                offset: fall == 0
                    ? Offset(0, (h - 60) * 0.40 + (r - v))
                    : Offset(0, (h - 60) * 0.40 + animation.value),
                child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                        decoration: BoxDecoration(
                          border:
                              Border.all(color: Color(0xFFEEF5FD), width: 3),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30)),
                          color: Colors.white,
                        ),
                        height: (h - 60) * 0.5,
                        width: w,
                        child: Column(
                          children: [
                            Container(
                                height: 0.03 * (h - 60),
                                width: w,
                                alignment: Alignment.center,
                                child: Icon(
                                  Icons.keyboard_arrow_up,
                                  color: Color(0xFF548CCC),
                                )),
                            Container(
                                height: 0.03 * (h - 60),
                                alignment: Alignment.centerLeft,
                                padding: EdgeInsets.only(left: 0.08 * w),
                                child: Text("Active friends today",
                                    style: TextStyle(
                                      color: Colors.black,
                                    )))
                          ],
                        ))),
              ))
        ]),
        bottomNavigationBar: Container(
          decoration:
              BoxDecoration(border: Border.all(color: Colors.grey, width: 0.2)),
          child: BottomNavigationBar(
            unselectedItemColor: Color(0xFF979797),
            backgroundColor: Colors.white,
            elevation: 0,
            items: [
              BottomNavigationBarItem(
                icon: Icon(Note.sticky_note_2_24px, size: 30),
                title: Text('events',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontFamily: "roboto")),
              ),
              BottomNavigationBarItem(
                icon: Icon(MyFlutterApp.home_1, size: 30),
                title: Text('home',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontFamily: "roboto")),
              ),
              BottomNavigationBarItem(
                icon: Icon(Circle.circle_thin, size: 30),
                title: Text('profile',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontFamily: "roboto")),
              ),
            ],
            currentIndex: selectedIndex,
            selectedItemColor: Color(0xFF548CCC),
            onTap: (i) {},
          ),
        ));
  }
}
