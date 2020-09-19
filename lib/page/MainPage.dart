import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:toast/toast.dart';
import 'package:wzryzs/page/LoginPage.dart';
import 'package:wzryzs/page/SplashPage.dart';
import 'package:wzryzs/page/main/ChartPage.dart';
import 'package:wzryzs/page/main/ClubPage.dart';
import 'package:wzryzs/page/main/MinePage.dart';
import 'package:wzryzs/page/main/MyNewsPage.dart';
import 'package:wzryzs/page/main/NewsPage.dart';
import 'package:wzryzs/page/main/RecordPage.dart';

class MainPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return StateMainPage();
  }
}

class StateMainPage extends State<MainPage> {
  int lastTapTime = 0;

  int tabIndex = 0;

  List<BottomNavigationBarItem> bottomNavigaitonBar = [];

  List<Widget> tabView = [
    MyNewsPage(),
    ChartPage(),
    ClubPage(),
    RecordPage(),
    MinePage()
  ];

  List<String> tabTitle = ["资讯", "聊天", "社区", "战绩", "我"];
  List<String> tabImage = [
    "images/v4/hot_tag_rank2.png",
    "images/v4/img_search_visible.png",
    "images/v4/img_publish_video.png",
    "images/v4/img_publish_photo.png",
    "images/v4/img_publish_more.png"
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    bottomNavigaitonBar = [];
    for (int i = 0; i < tabTitle.length; i++) {
      bottomNavigaitonBar.add(BottomNavigationBarItem(
        //激活状态是的字体颜色为蓝色,未激活的为gray
          title: Text(tabTitle[i],
              style: TextStyle(
                  color: tabIndex == i ? Colors.orangeAccent : Colors.grey,
                  fontSize: 11.0)),
          icon: Image.asset(
            tabImage[i],
            color: tabIndex == i ? Colors.orangeAccent : Colors.grey,
            width: 25.0,
            height: 25.0,
          )));
    }
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
//          backgroundColor: Colors.white70,
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            items: bottomNavigaitonBar,
            onTap: (index) {
              if (tabIndex == index) {
                return;
              }
              tabIndex = index;
              setState(() {});
            },
          ),
          body: IndexedStack(
            index: tabIndex,
            children: tabView,
          ),
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
