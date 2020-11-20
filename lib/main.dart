import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:myapp/screen/homepage/homeAppBar.dart';
import 'package:myapp/screen/common/bottomAppBar.dart';
import 'package:myapp/screen/chat/chatAppBar.dart';
import 'package:myapp/screen/profile/profileAppBar.dart';
import 'package:myapp/screen/homepage/homePage.dart';

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
        scaffoldBackgroundColor: Colors.white,
      ),
      home: TravellatoHomePage(),
      initialRoute: '/',
      routes: {
        // '/map': (context) => SearchMap(),
        '/profile': (context) => ProfileAppBar(),
        '/chat': (context) => ChatAppBar(),
      },
    );
  }
}

class TravellatoHomePage extends StatefulWidget {
  @override
  _TravellatoHomePage createState() => _TravellatoHomePage();
}

class _TravellatoHomePage extends State<TravellatoHomePage> {
  PageController _myPage;
  var selectedPage;

  @override
  void initState() {
    super.initState();
    _myPage = PageController(initialPage: 0);
    selectedPage = 0;
  }

  callback(int i) {
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

  @override
  Widget build(BuildContext context) {
    // print(MaterialLocalizations.of(context));
    return Scaffold(
      body: PageView(
        controller: _myPage,
        children: <Widget>[
          Container(
            color: Colors.white,
            child: Column(
              children: [
                HomeAppBar(),
                HomePage(),
              ],
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
              children: [
                ChatAppBar(),
                Text("Profile page"),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomBar(callback),
    );
  }
}
