import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:myapp/login.dart';
import 'package:myapp/home.dart';

void main() {
  runApp(Start());
}

class Start extends StatelessWidget {
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
  PageController _myPage2;
  var selectedPage2;
  PageController _myPage;
  var selectedPage;
  Animation<Color> animation;
  AnimationController controller;

  Animation<double> animation2;
  AnimationController controller2;

  @override
  void initState() {
    super.initState();
    _myPage = PageController(initialPage: 0);
    selectedPage = 0;

    _myPage2 = PageController(initialPage: 0);
    selectedPage2 = 0;

    controller = AnimationController(
        duration: const Duration(milliseconds: 800), vsync: this);
    animation = ColorTween(begin: Color(0xFFC4C4C4), end: Color(0xFF548CCC))
        .animate(controller)
          ..addListener(() {
            setState(() {
              // The state that has changed here is the animation object’s value.
            });
          });
    controller2 = AnimationController(
        duration: const Duration(milliseconds: 1400), vsync: this);
    animation2 = Tween(begin: 0.0, end: 800.0).animate(new CurvedAnimation(
        parent: controller2,
        curve: Curves.easeInOutBack,
        reverseCurve: Curves.easeOut))
      ..addListener(() {
        setState(() {
          // The state that has changed here is the animation object’s value.
        });
      });
  }

  callback() async {
    controller2.forward();
    await Future.delayed(const Duration(seconds: 1), () {});
    Navigator.push(
        context, MaterialPageRoute(builder: (BuildContext context) => MyApp()));
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
      child: Transform.translate(
        offset: Offset(0, animation2.value),
        child: Container(
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  blurRadius: 1, // soften the shadow
                  spreadRadius: 0.001,
                  color: Color.fromRGBO(84, 140, 204, 0.2),
                  offset: Offset(0, -1),
                )
              ],
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(40))),
          child: PageView(
              physics: new NeverScrollableScrollPhysics(),
              scrollDirection: Axis.horizontal,
              controller: _myPage2,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 0.05 * h,
                    ),
                    Container(
                      height: 0.06 * h,
                      child: RaisedButton(
                        padding: EdgeInsets.all(10),
                        splashColor: Colors.red,
                        disabledElevation: 1.0,
                        shape: CircleBorder(),
                        disabledColor: Color(0xFFEEF5FD),
                        child: Icon(Icons.clear, color: Color(0xFF548CCC)),
                      ),
                    ),
                    Container(
                      height: 0.01 * h,
                    ),
                    selectedPage == 0
                        ? Container(
                            height: 0.1 * h,
                            alignment: Alignment.center,
                            child:
                                Text("Welcome", style: TextStyle(fontSize: 40)))
                        : selectedPage == 1
                            ? Container(
                                height: 0.1 * h,
                                alignment: Alignment.center,
                                child: Text("Welcome2",
                                    style: TextStyle(fontSize: 40)))
                            : Container(
                                height: 0.1 * h,
                                alignment: Alignment.center,
                                child: Text("Welcome3",
                                    style: TextStyle(fontSize: 40))),
                    Stack(children: [
                      Container(
                        alignment: Alignment.center,
                        child: Container(
                            height: 220,
                            width: 220,
                            decoration: BoxDecoration(
                                color: Color(0xFFEEF5FD),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(300)))),
                      ),
                      SizedBox(
                        height: 240,
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
                    Container(height: 0.05 * h),
                    selectedPage == 0
                        ? Container(
                            height: 0.05 * h,
                            alignment: Alignment.center,
                            child: Text(
                              "join in the world of travellato in a few\n steps! Scrivi già delle indicazioni qui!",
                              textAlign: TextAlign.center,
                              style:
                                  TextStyle(color: Colors.black, fontSize: 14),
                            ))
                        : selectedPage == 1
                            ? Container(
                                height: 0.05 * h,
                                alignment: Alignment.center,
                                child: Text(
                                  "Share your position and see \nwhere your best friends are!",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 14),
                                ))
                            : Container(
                                height: 0.05 * h,
                                alignment: Alignment.center,
                                child: Text(
                                  "blablablablabl bblabl bla \nblablabl bla!",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 14),
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
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50)))),
                        SizedBox(width: 5),
                        Container(
                            width: 8,
                            height: 8,
                            decoration: BoxDecoration(
                                color: selectedPage == 1
                                    ? animation.value
                                    : Color(0xFFC4C4C4),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50)))),
                        SizedBox(width: 5),
                        Container(
                            width: 8,
                            height: 8,
                            decoration: BoxDecoration(
                                color: selectedPage == 2
                                    ? animation.value
                                    : Color(0xFFC4C4C4),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50)))),
                      ],
                    ),
                    Container(
                      height: 0.06 * h,
                    ),
                    Container(
                      height: 0.06 * h,
                      alignment: Alignment.center,
                      child: RaisedButton(
                        onPressed: () {
                          _myPage2.animateToPage(1,
                              duration: Duration(seconds: 1),
                              curve: Curves.fastOutSlowIn);
                        },
                        disabledColor: Color(0xFFEEF5FD),
                        highlightColor: Color(0xFFEEF5FD),
                        splashColor: Color(0xFF548CCC),
                        elevation: 1,
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(50))),
                        color: Color(0xFFEEF5FD),
                        child: Container(
                            alignment: Alignment.center,
                            width: 150,
                            child: selectedPage != 2
                                ? Text("Skip tutorial",
                                    style: TextStyle(color: Color(0xFF548CCC)))
                                : Text("Continue to login",
                                    style:
                                        TextStyle(color: Color(0xFF548CCC)))),
                      ),
                    ),
                  ],
                ),
                Login(callback)
              ]),
        ),
      ),
    ));
  }
}

class Page1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double h = MediaQuery.of(context).size.height;
    final double w = MediaQuery.of(context).size.width;
    return Container(
      alignment: Alignment.bottomCenter,
      child: ClipRRect(child: Image(image: AssetImage('graphics/frame36.png'))),
    );
  }
}

class Page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double h = MediaQuery.of(context).size.height;
    final double w = MediaQuery.of(context).size.width;
    return Container(
      alignment: Alignment.bottomCenter,
      padding: EdgeInsets.only(top: 0.01 * h),
      child: ClipRRect(child: Image(image: AssetImage('graphics/frame37.png'))),
    );
  }
}

class Page3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double h = MediaQuery.of(context).size.height;
    final double w = MediaQuery.of(context).size.width;
    return Container(
      alignment: Alignment.bottomCenter,
      padding: EdgeInsets.only(top: 0.01 * h),
      child: ClipRRect(child: Image(image: AssetImage('graphics/frame34.png'))),
    );
  }
}
