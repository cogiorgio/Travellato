import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

class Post extends StatefulWidget {
  @override
  _Post createState() => _Post();
}

class _Post extends State<Post> with TickerProviderStateMixin {
  int active = 0;
  //animations controller
  AnimationController _controller;
  Animation _animation;

  @override
  void initState() {
    super.initState();

    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 800));

    _animation = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.fastOutSlowIn,
    ));
  }

  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _controller,
        builder: (BuildContext context, Widget Child) {
          return Container(
            padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
            height: 50,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey, width: 0.3),
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
            ),
            child: Directionality(
                textDirection: TextDirection.rtl,
                child: Row(
                  children: [
                    Flexible(
                        flex: 16,
                        child: Stack(children: [
                          Row(
                            children: [
                              Flexible(flex: 1, child: Container()),
                              Flexible(
                                flex: 1,
                                child: GestureDetector(
                                    onTap: () {
                                      _controller.reset();
                                      _animation = Tween(begin: 0.0, end: 1.0)
                                          .animate(CurvedAnimation(
                                        parent: _controller,
                                        curve: Curves.fastOutSlowIn,
                                      ));
                                      if (active == 0)
                                        setState(() {
                                          active = 1;
                                          _controller.forward();
                                        });
                                      _controller.forward();
                                    },
                                    child: Icon(Icons.arrow_forward_ios,
                                        color: Color(0xFFB74545))),
                              ),
                              Flexible(flex: 1, child: Container()),
                              Flexible(
                                  flex: 8,
                                  child: Text(
                                    "'Andiamo all'alcatraz'",
                                    style: TextStyle(
                                        color: Color(0xFFB74545), fontSize: 12),
                                  )),
                            ],
                          ),
                          active == 0
                              ? Container()
                              : SizeTransition(
                                  sizeFactor: _animation,
                                  axis: Axis.horizontal,
                                  child: Container(
                                      height: 50,
                                      decoration: BoxDecoration(
                                          color: Color(0xFFB74545),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10.0))),
                                      child: Row(children: [
                                        Flexible(flex: 1, child: Container()),
                                        Flexible(
                                            flex: 1,
                                            child: Icon(Icons.chat,
                                                color: Colors.white)),
                                        Flexible(flex: 1, child: Container()),
                                        Flexible(
                                            flex: 1,
                                            child: Icon(Icons.add,
                                                color: Colors.white)),
                                        Flexible(flex: 1, child: Container()),
                                        Flexible(
                                          flex: 1,
                                          child: GestureDetector(
                                            onTap: () {
                                              _controller.reset();
                                              _animation =
                                                  Tween(begin: 1.0, end: 0.0)
                                                      .animate(CurvedAnimation(
                                                parent: _controller,
                                                curve: Curves.fastOutSlowIn,
                                              ));
                                              _controller.forward();
                                            },
                                            child: Icon(Icons.arrow_back_ios,
                                                color: Colors.white),
                                          ),
                                        ),
                                      ])))
                        ])),
                    Flexible(flex: 1, child: Container()),
                    Flexible(
                        flex: 9,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Manuel trivillino",
                                style: TextStyle(fontSize: 12)),
                            Text(
                              "Piazza aspromonte 23",
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 10),
                            )
                          ],
                        )),
                    Flexible(flex: 2, child: Container()),
                    Container(
                      height: 38,
                      width: 38,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(100.0)),
                        color: Colors.white,
                        border: Border.all(color: Colors.red, width: 0.3),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image(
                          image: NetworkImage(
                              'https://www.amoreaquattrozampe.it/wp-content/uploads/2017/05/carlino-1.jpg'),
                        ),
                      ),
                    ),
                  ],
                )),
          );
        });
  }
}
