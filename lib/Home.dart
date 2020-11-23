import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
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
      selectedPage = 0;
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
            color: Colors.white,
            child: Column(
              children: [HomeAppBar(), HomePage()],
            ),
          ),
          Container(
            color: Colors.white,
            child: Column(children: [
              ProfileAppBar(),
              Text("profile"),
            ]),
          ),
          Container(
            color: Colors.white,
            child: Column(
              children: [ChatAppBar(), Text("Profile page")],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomBar(callaback),
    );
  }
}
