import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

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
