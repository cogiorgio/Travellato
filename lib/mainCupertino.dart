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
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.top]);

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
      appBar: CupertinoNavigationBar(
        border: Border.all(style: BorderStyle.none),
        backgroundColor: Color(0xFFEAEAEA),
        leading: Transform.rotate(
          angle: 90 * 3.14 / 180,
          child: Icon(
            CupertinoIcons.ellipsis,
            color: Color(0xFFB74545),
            size: 35,
          ),
        ),
        middle: Text(
          "Travellato",
          style: TextStyle(fontSize: 35),
        ),
        trailing: Notifications(),
      ),
      bottomNavigationBar: Text("ciao"),
      body: Column(
        children: [
          Container(
            color: Color(0xFFEAEAEA),
            child: Row(
              children: [
                Flexible(flex: 1, child: Container()),
                Flexible(
                  flex: 18,
                  child: Container(
                    padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                    child: SearchBar(),
                  ),
                ),
                Flexible(flex: 1, child: Container()),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class HomeAppBar extends StatelessWidget with PreferredSizeWidget {
  @override
  final Size preferredSize;

  HomeAppBar({
    Key key,
  })  : preferredSize = Size.fromHeight(50.0),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey,
      child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
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
              ],
            ),
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
      padding: EdgeInsets.fromLTRB(5, 1, 5, 1),
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

/*

class SearchBar extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<SearchBar> {
  Widget build(BuildContext context) {
    return Container(
      height: 25,
      width: 300,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(15.0)),
          border: Border.all(
            color: Colors.grey,
            width: 1,
          )),
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Flexible(
          flex: 1,
          child: Icon(CupertinoIcons.search, color: Colors.grey),
        ),
        Flexible(
          flex: 9,
          child: Material(
            child: TextField(
              maxLines: 1,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Search...',
                hintStyle: TextStyle(fontSize: 13),
              ),
              textAlignVertical: TextAlignVertical.center,
            ),
          ),
        ),
        Flexible(
          flex: 1,
          child: Container(),
        ),
      ]),
    );
  }
}


import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        backgroundColor:Color(0xE5E5E5E5),
      ),
      home: Column(
        children:[
          Flexible(
            flex:2,
            child:Container(
              color: Color(0xF5F4F4F4),
              padding:EdgeInsets.fromLTRB(5, 5, 5, 5),
              child:Row(
                children:[
                  Flexible(
                    flex:2,
                    child:Icon(CupertinoIcons.add,size:100,color: Color(0xFF5A935F)),
                  ),
                  Flexible(
                    flex:5,
                    child:Container(
                      padding: EdgeInsets.only(left:40,right:5),
                      child:
                      Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:[
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment:MainAxisAlignment.center,
                          children:[
                          Text("Marti",
                            style: TextStyle(
                              fontSize: 25.0,
                              fontWeight: FontWeight.w100,
                              color: Colors.black,
                              decoration: TextDecoration.none,
                            ),
                          ),
                          
                          Text("OUTFIT",
                            style: TextStyle(
                              fontSize: 25.0,
                              fontWeight: FontWeight.w100,
                              color: Color(0xFF5A935F),
                              decoration: TextDecoration.none,
                            ),
                          ),
                          ]
                        ),
                        Container(
                        padding: EdgeInsets.only(top:5),
                        child:SizedBox(
                          height:1,
                          child:Container(
                            color:Color(0xFF5A935F),
                          ),
                        ),
                        ),
                          Container(
                            padding: EdgeInsets.only(top:10),
                            child:SearchBar(),
                          ),
                      ]
                    ),
                  ),
                  ),
                ],
              ),
            ),  
          ),
          Flexible(
            flex:8,
            child:Container(
              color:Colors.white,
              child:Row(
                children:[Post(),],
              ),
            ),  
          ),  
        ],
      ),
    );

    
  }
}





class Post extends StatefulWidget {  
  @override  
  _PostState createState() => _PostState();  
}  

class _PostState extends State<Post> {  
  
  Widget build(BuildContext context) { 
    return Container(
      height:275,
      padding: EdgeInsets.fromLTRB(15,15,15,15),
      child:Container(
        decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        border: Border.all(
                color: Colors.grey,
                width: 0.5,
              )
        ),
        child:Column(),
      ), 
    );
        
  }  
}  
*/
