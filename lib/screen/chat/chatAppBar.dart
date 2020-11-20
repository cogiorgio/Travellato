import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myapp/screen/homepage/searchBar.dart';

class ChatAppBar extends StatelessWidget with PreferredSizeWidget {
  @override
  final Size preferredSize;

  ChatAppBar({
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
                    Icons.add,
                    color: Color(0xFFB74545),
                    size: 35,
                  ),
                ),
                Expanded(
                  child: Container(
                    alignment: Alignment.bottomCenter,
                    child: Text(
                      "Messages",
                      style: TextStyle(fontSize: 35),
                    ),
                  ),
                ),
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
