import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wzryzs/page/LoginPage.dart';
import 'package:wzryzs/page/MainPage.dart';

class SplashPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return StateSplashPage();
  }
}

class StateSplashPage extends State<SplashPage> {
  int time = 3;

  Timer timer;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    timer = Timer.periodic(Duration(seconds: 1), (t) {
      time--;
      if (time <= 0) {
        Navigator.of(context).pushAndRemoveUntil( MaterialPageRoute(builder: (BuildContext context){
          return LoginPage();
        }),(route)=>false);
        timer.cancel();
      } else {
        setState(() {});
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    timer?.cancel();
    timer = null;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(
      children: [
        Image.asset(
          "images/splash.jpg",
          fit: BoxFit.fitWidth,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
        ),
        Positioned(
            right: 13,
            bottom: 12,
            child: Opacity(
              opacity: 0.3,
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.all(Radius.circular(5))),
                width: 54,
                height: 26,
              ),
            )),
        Positioned(
            right: 13,
            bottom: 12,
            child: GestureDetector(
              onTap: (){
                Navigator.of(context).pushAndRemoveUntil( MaterialPageRoute(builder: (BuildContext context){
                  return LoginPage();
                }),(route)=>false);
                timer.cancel();
              },
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.all(Radius.circular(5))),
                width: 54,
                height: 26,
                child: Text(
                  "跳过" + time.toString(),
                  style: TextStyle(
                      color: Colors.white70,
                      fontSize: 12,
                      letterSpacing: 1,
                      decoration: TextDecoration.none,
                      fontWeight: FontWeight.w300),
                ),
              ),
            ))
      ],
    );
  }
}
