import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';
import 'package:wzryzs/page/MainPage.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return StateLoginPage();
  }
}

class StateLoginPage extends State<LoginPage> {
  bool agree = false;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(
      children: [
        Image.asset(
          "images/login_bg.webp",
          fit: BoxFit.fill,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
        ),
        //qq
        Positioned(
          bottom: 200,
          left: 50,
          right: 50,
          child: GestureDetector(
              onTap: () {
                if(!agree){
                  Toast.show("请先阅读服务协议和隐私政策,然后勾选", context);
                  return;
                }
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (BuildContext context) {
                  return MainPage();
                }), (route) => false);
              },
              child: Container(
                color: Colors.orangeAccent,
                width: 200,
                height: 40,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "images/v4/q_normal.png",
                      width: 20,
                      height: 20,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "QQ",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          decoration: TextDecoration.none,
                          fontWeight: FontWeight.w200),
                    )
                  ],
                ),
              )),
        ),
        //wx
        Positioned(
          bottom: 140,
          left: 50,
          right: 50,
          child: GestureDetector(
              onTap: () {
                if(!agree){
                  Toast.show("请先阅读服务协议和隐私政策,然后勾选", context);
                  return;
                }
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (BuildContext context) {
                  return MainPage();
                }), (route) => false);
              },
              child: Container(
                color: Colors.orangeAccent,
                width: 200,
                height: 40,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "images/v4/wx_normal.png",
                      width: 20,
                      height: 20,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "微信",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          decoration: TextDecoration.none,
                          fontWeight: FontWeight.w200),
                    )
                  ],
                ),
              )),
        ),
        //协议
        Positioned(
            bottom: 70,
            left: 60,
            right: 60,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      agree = !agree;
                    });
                  },
                  child: Container(
                    margin: EdgeInsets.only(top: 4),
                    child: Image.asset(
                      agree
                          ? "images/v4/login_license_checked.png"
                          : "images/v4/login_license_unchecked.png",
                      width: 15,
                      height: 13,
                    ),
                  ),
                ),
                Expanded(
                    child: Text.rich(TextSpan(children: [
                  TextSpan(
                      text: "我已经详细阅读病痛与：",
                      style: TextStyle(
                          color: Colors.orange,
                          fontSize: 13,
                          decoration: TextDecoration.none,
                          fontWeight: FontWeight.w200)),
                  TextSpan(
                      text: "《王者营地软件许可及服务协议》",
                      style: TextStyle(
                          color: Colors.brown,
                          fontSize: 13,
                          decoration: TextDecoration.none,
                          fontWeight: FontWeight.w200)),
                  TextSpan(
                      text: "和",
                      style: TextStyle(
                          color: Colors.orange,
                          fontSize: 13,
                          decoration: TextDecoration.none,
                          fontWeight: FontWeight.w200)),
                  TextSpan(
                      text: "《隐私政策》",
                      style: TextStyle(
                          color: Colors.brown,
                          fontSize: 13,
                          decoration: TextDecoration.none,
                          fontWeight: FontWeight.w200)),
                ])))
              ],
            ))
      ],
    );
  }
}
