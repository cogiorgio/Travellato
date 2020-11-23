import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

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

    return CupertinoApp(
      theme: CupertinoThemeData(
        scaffoldBackgroundColor: Color(0xFFEEF5FD),
      ),
      home: Tutorial(),
    );
  }
}

class Tutorial extends StatefulWidget {
  @override
  _Tutorial createState() => _Tutorial();
}

class _Tutorial extends State<Tutorial> with TickerProviderStateMixin {
  PageController _myPage;
  var selectedPage;
  Animation<Color> animation;
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    _myPage = PageController(initialPage: 0);
    selectedPage = 0;

    controller = AnimationController(
        duration: const Duration(milliseconds: 800), vsync: this);
    animation = ColorTween(begin: Color(0xFFC4C4C4), end: Color(0xFF548CCC))
        .animate(controller)
          ..addListener(() {
            setState(() {
              // The state that has changed here is the animation object’s value.
            });
          });
  }

  @override
  Widget build(BuildContext context) {
    controller.forward();
    final double h = MediaQuery.of(context).size.height;
    final double w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        height: h,
        width: w,
        color: Color(0xFFEEF5FD),
        padding: EdgeInsets.only(top: 0.08 * h),
        child: Container(
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  blurRadius: 10, // soften the shadow
                  spreadRadius: 0.001,
                  color: Color.fromRGBO(84, 140, 204, 0.2),
                  offset: Offset(0, -1),
                )
              ],
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(40))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 0.05 * h,
              ),
              RaisedButton(
                padding: EdgeInsets.all(15),
                splashColor: Colors.red,
                disabledElevation: 1.0,
                shape: CircleBorder(),
                disabledColor: Color(0xFFEEF5FD),
                child: Icon(Icons.clear, color: Color(0xFF548CCC)),
              ),
              Container(
                height: 0.01 * h,
              ),
              selectedPage == 0
                  ? Container(
                      height: 0.1 * h,
                      alignment: Alignment.center,
                      child: Text("Welcome", style: TextStyle(fontSize: 40)))
                  : selectedPage == 1
                      ? Container(
                          height: 0.1 * h,
                          alignment: Alignment.center,
                          child:
                              Text("Welcome2", style: TextStyle(fontSize: 40)))
                      : Container(
                          height: 0.1 * h,
                          alignment: Alignment.center,
                          child:
                              Text("Welcome3", style: TextStyle(fontSize: 40))),
              Stack(children: [
                Container(
                  alignment: Alignment.center,
                  height: 0.32 * h,
                  padding: EdgeInsets.only(top: 0.0 * h),
                  child: Container(
                      height: 200,
                      width: 200,
                      decoration: BoxDecoration(
                          color: Color(0xFFEEF5FD),
                          borderRadius:
                              BorderRadius.all(Radius.circular(300)))),
                ),
                SizedBox(
                  height: 0.37 * h,
                  width: w,
                  child: PageView(
                      onPageChanged: (int i) {
                        controller.reset();
                        selectedPage = i;

                        setState() {}
                        ;
                        controller.reset();
                      },
                      scrollDirection: Axis.horizontal,
                      controller: _myPage,
                      children: [Page1(), Page2(), Page3()]),
                ),
              ]),
              selectedPage == 0
                  ? Container(
                      height: 0.05 * h,
                      alignment: Alignment.center,
                      child: Text(
                        "join in the world of travellato in a few\n steps! Scrivi già delle indicazioni qui!",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.black, fontSize: 14),
                      ))
                  : selectedPage == 1
                      ? Container(
                          height: 0.05 * h,
                          alignment: Alignment.center,
                          child: Text(
                            "Share your position and see \nwhere your best friends are!",
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.black, fontSize: 14),
                          ))
                      : Container(
                          height: 0.05 * h,
                          alignment: Alignment.center,
                          child: Text(
                            "blablablablabl bblabl bla \nblablabl bla!",
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.black, fontSize: 14),
                          )),
              Container(
                height: 0.04 * h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                          color: selectedPage == 0
                              ? animation.value
                              : Color(0xFFC4C4C4),
                          borderRadius: BorderRadius.all(Radius.circular(50)))),
                  SizedBox(width: 5),
                  Container(
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                          color: selectedPage == 1
                              ? animation.value
                              : Color(0xFFC4C4C4),
                          borderRadius: BorderRadius.all(Radius.circular(50)))),
                  SizedBox(width: 5),
                  Container(
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                          color: selectedPage == 2
                              ? animation.value
                              : Color(0xFFC4C4C4),
                          borderRadius: BorderRadius.all(Radius.circular(50)))),
                ],
              ),
              Container(
                height: 0.06 * h,
              ),
              Container(
                height: 0.06 * h,
                alignment: Alignment.center,
                child: RaisedButton(
                  onPressed: () {},
                  disabledColor: Color(0xFFEEF5FD),
                  highlightColor: Color(0xFFEEF5FD),
                  splashColor: Color(0xFF548CCC),
                  disabledElevation: 1.0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(50))),
                  color: Color(0xFFEEF5FD),
                  child: Container(
                      alignment: Alignment.center,
                      width: 150,
                      child: Text("Skip tutorial",
                          style: TextStyle(color: Color(0xFF548CCC)))),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Page1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double h = MediaQuery.of(context).size.height;
    final double w = MediaQuery.of(context).size.width;
    return Column(children: [
      Container(
        height: 0.02 * h,
      ),
      Container(
        height: 0.3 * h,
        alignment: Alignment.center,
        child:
            ClipRRect(child: Image(image: AssetImage('graphics/frame36.png'))),
      ),
      Container(
        height: 0.05 * h,
      ),
    ]);
  }
}

class Page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double h = MediaQuery.of(context).size.height;
    final double w = MediaQuery.of(context).size.width;
    return Column(children: [
      Container(
        height: 0.02 * h,
      ),
      Container(
        height: 0.3 * h,
        alignment: Alignment.center,
        child:
            ClipRRect(child: Image(image: AssetImage('graphics/frame37.png'))),
      ),
      Container(
        height: 0.05 * h,
      ),
    ]);
  }
}

class Page3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double h = MediaQuery.of(context).size.height;
    final double w = MediaQuery.of(context).size.width;
    return Column(children: [
      Container(
        height: 0.02 * h,
      ),
      Container(
        height: 0.3 * h,
        padding: EdgeInsets.only(right: 10),
        alignment: Alignment.center,
        child:
            ClipRRect(child: Image(image: AssetImage('graphics/frame34.png'))),
      ),
      Container(
        height: 0.05 * h,
      ),
    ]);
  }
}
