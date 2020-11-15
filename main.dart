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
  List<Widget> _pages = [uno(), due()];
  @override
  Widget build(BuildContext context) {
    print(MaterialLocalizations.of(context));
    return Scaffold(
      appBar: HomeAppBar(),
      bottomNavigationBar: BottomBar(),
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

class uno extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('due'),
    );
  }
}

class BottomBar extends StatefulWidget {
  @override
  _BottomBar createState() => _BottomBar();
}

class _BottomBar extends State<BottomBar> {
  int index = 0;
  _handleTap(int s) {
    setState(() {
      if (s == 0)
        this.index = 0;
      else if (s == 1)
        this.index = 1;
      else
        this.index = 2;
    });
  }

  Color getSelect(int l) {
    print(index);

    if ((index == 0 && l == 0) ||
        (index == 1 && l == 1) ||
        (index == 2 && l == 2)) {
      return Color(0xFFB74545);
    } else {
      return Colors.black;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
                style: BorderStyle.solid, width: 0.2, color: Colors.grey)),
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
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Home",
                          style: TextStyle(
                            fontSize: 17,
                            color: getSelect(0),
                          ),
                        ),
                        Container(
                            height: 1,
                            color: (getSelect(0) == Colors.black)
                                ? Colors.white
                                : Color(0xFFB74545)),
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
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Profile",
                          style: TextStyle(fontSize: 17, color: getSelect(1)),
                        ),
                        Container(
                          height: 1,
                          color: (getSelect(1) == Colors.black)
                              ? Colors.white
                              : Color(0xFFB74545),
                        )
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
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Chat",
                          style: TextStyle(fontSize: 17, color: getSelect(2)),
                        ),
                        Container(
                            height: 1,
                            color: (getSelect(2) == Colors.black)
                                ? Colors.white
                                : Color(0xFFB74545)),
                      ],
                    )),
              ),
            ),
          ],
        ));
  }
}

class due extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('uno'),
    );
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
