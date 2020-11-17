import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'HomeAppBar.dart';
import 'SearchBar.dart';
import 'notifications.dart';
import 'BottomAppBar.dart';

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
      _myPage.animateToPage(0,
          duration: Duration(seconds: 1), curve: Curves.fastOutSlowIn);
    } else if (i == 1) {
      _myPage.animateToPage(1,
          duration: Duration(seconds: 1), curve: Curves.fastOutSlowIn);
      selectedPage = 1;
    } else {
      _myPage.animateToPage(2,
          duration: Duration(seconds: 1), curve: Curves.fastOutSlowIn);
      selectedPage = 2;
    }
  }
//SEI SCARSO A PROGRAMMARE <3 concordo

  @override
  Widget build(BuildContext context) {
    print(MaterialLocalizations.of(context));
    return Scaffold(
      body: PageView(
        controller: _myPage,
        children: <Widget>[
          Container(
            color: Colors.red,
            child: Column(
              children: [HomeAppBar(), Text("Porco dio 1")],
            ),
          ),
          Container(
            color: Colors.blue,
            child: Column(
              children: [HomeAppBar2(), Text("Porco dio 2")],
            ),
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

class HomeAppBar2 extends StatelessWidget with PreferredSizeWidget {
  @override
  final Size preferredSize;

  HomeAppBar2({
    Key key,
  })  : preferredSize = Size.fromHeight(120.0),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(height: 20, color: Colors.orange);
  }
}

class HomeAppBar extends StatelessWidget with PreferredSizeWidget {
  @override
  final Size preferredSize;

  HomeAppBar({
    Key key,
  })  : preferredSize = Size.fromHeight(140.0),
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
                  padding: EdgeInsets.fromLTRB(0, 20, 0, 15),
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
