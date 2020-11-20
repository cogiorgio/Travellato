import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
    _controller.reset();
    _controller.forward();
    return AnimatedBuilder(
        animation: _controller,
        builder: (BuildContext context, Widget child) {
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
