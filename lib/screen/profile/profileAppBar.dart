import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileAppBar extends StatelessWidget with PreferredSizeWidget {
  @override
  final Size preferredSize;

  ProfileAppBar({
    Key key,
  })  : preferredSize = Size.fromHeight(170.0),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 170,
      width: MediaQuery.of(context).size.width,
      color: Color(0xFFB74545),
      padding: EdgeInsets.fromLTRB(15, 30, 15, 0),
      child: Row(
        children: [
          Container(
            height: 90,
            width: 90,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(100.0)),
              color: Colors.white,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Image(
                image: NetworkImage(
                    'https://www.amoreaquattrozampe.it/wp-content/uploads/2017/05/carlino-1.jpg'),
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      child: Text(
                        "ProfileName",
                        style: TextStyle(fontSize: 28, color: Colors.white),
                      ),
                    ),
                    Container(height: 1, color: Colors.black),
                    Container(
                        padding: EdgeInsets.only(top: 5),
                        child: Text(
                            "Thats an apple,blabla blablalba lblalblbalbabl")),
                  ]),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 30),
            alignment: Alignment.topCenter,
            child: Icon(
              Icons.menu,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
