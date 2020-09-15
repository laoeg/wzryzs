import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:toast/toast.dart';
import 'package:wzryzs/page/main/NewsPage.dart';

class MainPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return StateMainPage();
  }
}

class StateMainPage extends State<MainPage> {
  int lastTapTime = 0;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return WillPopScope(
        child: Scaffold(
          appBar: AppBar(
            toolbarHeight: 0,
            shadowColor: Colors.white,
            brightness: Brightness.light,
            backgroundColor: Colors.white,
            elevation: 0,
            automaticallyImplyLeading: false, //设置没有返回按钮
//            title: Center(
//              child: Text(
//                S.of(context).title,
//                style: TextStyle(color: Colors.black, fontSize: 17.0),
//              ),
//            ),
          ),
          body: NewsPage(),
        ),
        onWillPop: () async {
          print("onWillPop************");
          print("两次时间差1：" + lastTapTime.toString());
          print(
              "两次时间差2：" + new DateTime.now().millisecondsSinceEpoch.toString());
          int temp = new DateTime.now().millisecondsSinceEpoch - lastTapTime;
          print("两次时间差3：" + temp.toString());
          if (temp <= 1000 && temp > 0) {
            //退出应用
            SystemNavigator.pop();
            return true;
          } else {
            // 按两次返回键退出，这是按第一次的时候给用户的提示
            lastTapTime = new DateTime.now().millisecondsSinceEpoch;
            Toast.show("再次点击退出", context);
            return false;
          }
        });
  }
}
