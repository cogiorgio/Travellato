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
    // SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.top]);

    return CupertinoApp(
      theme: CupertinoThemeData(
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

class _CupertinoHomePage extends State<CupertinoHomePage> {
  PageController _myPage;
  var selectedPage;

  @override
  void initState() {
    super.initState();
    _myPage = PageController(initialPage: 0);
    selectedPage = 0;
  }

  callaback(int i) {
    if (i == 0) {
      _myPage.jumpToPage(0);
      selectedPage = 0;
    } else if (i == 1) {
      _myPage.jumpToPage(1);
      selectedPage = 1;
    } else {
      _myPage.jumpToPage(2);
      selectedPage = 2;
    }
  }

  @override
  Widget build(BuildContext context) {
    print(MaterialLocalizations.of(context));
    return Scaffold(
      appBar: HomeAppBar(),
      body: PageView(
        controller: _myPage,
        children: <Widget>[
          Container(
            color: Colors.red,
            child: Text("Porco dio 1"),
          ),
          Container(
            color: Colors.blue,
            child: Text("Porco dio 2"),
          ),
          Container(
            color: Colors.green,
            child: Text("Porco dio 3"),
          ),
        ],
      ),
      bottomNavigationBar: BottomBar(callaback),
    );
  }
}

class HomeAppBar extends StatelessWidget with PreferredSizeWidget {
  @override
  final Size preferredSize;

  HomeAppBar({
    Key key,
  })  : preferredSize = Size.fromHeight(120.0),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 30),
      width: MediaQuery.of(context).size.width,
      color: Color(0xFFEAEAEA),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
            child: Row(
              children: [
                Transform.rotate(
                  angle: 90 * 3.14 / 180,
                  child: Icon(
                    CupertinoIcons.ellipsis,
                    color: Color(0xFFB74545),
                    size: 35,
                  ),
                ),
                Expanded(
                  child: Container(
                    alignment: Alignment.bottomCenter,
                    child: Text(
                      "Travellato",
                      style: TextStyle(fontSize: 35),
                    ),
                  ),
                ),
                Notifications(),
              ],
            ),
          ),
          Row(
            children: [
              Flexible(flex: 1, child: Container()),
              Flexible(
                flex: 18,
                child: Container(
                  padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                  child: SearchBar(),
                ),
              ),
              Flexible(flex: 1, child: Container()),
            ],
          )
        ],
      ),
    );
  }
}

class BottomBar extends StatefulWidget {
  Function(int) callback;
  BottomBar(this.callback);
  @override
  _BottomBar createState() => _BottomBar();
}

class _BottomBar extends State<BottomBar> with TickerProviderStateMixin {
  int index = 0;

  //animations controller
  AnimationController _controller;
  Animation _animation;

  @override
  void initState() {
    super.initState();

    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 400));

    _animation = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.fastOutSlowIn,
    ));
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    _controller.reset();
    _controller.forward();
    return AnimatedBuilder(
        animation: _controller,
        builder: (BuildContext context, Widget Child) {
          return Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                      style: BorderStyle.solid,
                      width: 0.2,
                      color: Colors.grey)),
              width: MediaQuery.of(context).size.width,
              height: 70,
              child: Row(
                children: [
                  Flexible(
                    flex: 1,
                    child: Container(
                      padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                      child: GestureDetector(
                          onTap: () {
                            setState(() {
                              index = 0;
                              widget.callback(0);
                            });
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Home",
                                style: TextStyle(
                                  fontSize: 17,
                                  color: (index == 0)
                                      ? Color(0xFFB74545)
                                      : Colors.black,
                                ),
                              ),
                              (index == 0)
                                  ? Transform.scale(
                                      scale: 1 * _animation.value,
                                      child: Container(
                                          height: 1,
                                          color: (index == 0)
                                              ? Color(0xFFB74545)
                                              : Colors.black),
                                    )
                                  : Container(height: 1, color: Colors.white),
                            ],
                          )),
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: Container(
                      padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                      child: GestureDetector(
                          onTap: () {
                            setState(() {
                              index = 1;
                              widget.callback(1);
                            });
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Profile",
                                style: TextStyle(
                                    fontSize: 17,
                                    color: (index == 1)
                                        ? Color(0xFFB74545)
                                        : Colors.black),
                              ),
                              (index == 1)
                                  ? Transform.scale(
                                      scale: 1 * _animation.value,
                                      child: Container(
                                          height: 1, color: Color(0xFFB74545)),
                                    )
                                  : Container(height: 1, color: Colors.white),
                            ],
                          )),
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: Container(
                      padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                      child: GestureDetector(
                          onTap: () {
                            setState(() {
                              index = 2;
                              widget.callback(2);
                            });
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Chat",
                                style: TextStyle(
                                    fontSize: 17,
                                    color: (index == 2)
                                        ? Color(0xFFB74545)
                                        : Colors.black),
                              ),
                              (index == 2)
                                  ? Transform.scale(
                                      scale: 1 * _animation.value,
                                      child: Container(
                                          height: 1, color: Color(0xFFB74545)),
                                    )
                                  : Container(height: 1, color: Colors.white),
                            ],
                          )),
                    ),
                  ),
                ],
              ));
        });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

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

class SearchBar extends StatefulWidget {
  @override
  _SearchBar createState() => _SearchBar();
}

class _SearchBar extends State<SearchBar> {
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
      alignment: Alignment.center,
      height: 40,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(7.0)),
          border: Border.all(
              style: BorderStyle.solid, width: 0.2, color: Colors.grey)),
      child: Row(children: [
        Flexible(
          flex: 1,
          child: Icon(Icons.search, color: Color(0xFFEB9B9B)),
        ),
        Spacer(),
        Flexible(
          flex: 19,
          child: Localizations(
            locale: const Locale('en', 'US'),
            delegates: <LocalizationsDelegate<dynamic>>[
              DefaultWidgetsLocalizations.delegate,
              DefaultMaterialLocalizations.delegate,
            ],
            child: MediaQuery(
              data: const MediaQueryData(),
              child: Directionality(
                textDirection: TextDirection.ltr,
                child: Material(
                  child: TextField(
                    maxLines: 1,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Search...',
                      hintStyle: TextStyle(fontSize: 16),
                    ),
                    textAlignVertical: TextAlignVertical.center,
                  ),
                ),
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
