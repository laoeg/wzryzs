import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wzryzs/page/main/FavouritePage.dart';
import 'package:wzryzs/page/main/RecordPage.dart';

class MyNewsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return StateMyNewsPage();
  }
}

class StateMyNewsPage extends State<MyNewsPage> with TickerProviderStateMixin {
  int activePosition = 1;
  double titleOneOffset = 60;
  List<String> titlesOne = ["关注", "推荐"];
  int activePositionOne = 1;
  List<String> titlesTwo = [];
  int activePositionTwo = 0;
  PageController pageController = PageController(initialPage: 1);

  double offset = 0;
  double screenWidth = -1;

  List<String> titleList = [
    "推荐",
    "赛事",
    "短视频",
    "全国大赛",
    "专栏",
    "直播",
    "英雄",
    "官方",
    "世界",
    "周边"
  ];

  ScrollController scrollController = ScrollController();
  double scrollOffset = 0;
  double bgOffset = 0;

  bool needScrollAnimation = true;

  Animation bgOffsetAnimation;
  AnimationController bgOffsetAnimationController;

  List<Widget> pages = [
    FavouritePage(),
    RecordPage(),
    RecordPage(),
    RecordPage(),
    RecordPage(),
    RecordPage(),
    RecordPage(),
    RecordPage(),
    RecordPage(),
    RecordPage(),
    RecordPage(),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    for (int i = 0; i < 10; i++) {
      titlesTwo.add("标题${i}");
    }
    bgOffsetAnimationController =
        AnimationController(duration: Duration(milliseconds: 100), vsync: this);
    pageController.addListener(() {
      offset = pageController.offset;
      if (offset <= screenWidth) {
        titleOneOffset = offset / screenWidth * 60;
      }
      if (offset > screenWidth) {
        double tempOffset = offset - screenWidth;
        double titleWidth = 0;
        if (tempOffset > 0) {
          titleWidth =
              getOffset(activePositionTwo) - getOffset(activePositionTwo - 1);
        }
        titleWidth = (titleWidth <= 0
            ? ((measureTextWidth(titleList[0], null)) + 30)
            : titleWidth);
        bgOffset = titleWidth * (tempOffset % screenWidth) / screenWidth +
            getOffset((tempOffset ~/ screenWidth));
//        print("offset" + bgOffset.toString());
      }
      setState(() {});
    });

    scrollController
      ..addListener(() {
        setState(() {
          scrollOffset = scrollController.offset;
        });
//        print("scroll:" + scrollController.offset.toString());
      });
  }

  double measureTextWidth(String t, TextStyle style) {
    final DefaultTextStyle defaultTextStyle = DefaultTextStyle.of(context);
    final TextPainter textPainter = TextPainter(
        text: TextSpan(text: t, style: defaultTextStyle.style.merge(style)),
        maxLines: 1,
        textDirection: TextDirection.ltr)
      ..layout(minWidth: 0, maxWidth: double.infinity);
    return textPainter.size.width;
  }

  double getOffset(int position) {
    double offset = 0;
    for (int i = 0; i < position; i++) {
      offset += measureTextWidth(titleList[i], null) + 30.0;
    }
    return offset;
  }

  @override
  Widget build(BuildContext context) {
    if (screenWidth == -1) {
      screenWidth = MediaQuery.of(context).size.width;
      offset = MediaQuery.of(context).size.width;
    }
    // TODO: implement build
    return Listener(
      onPointerDown: (detail) {},
      onPointerMove: (detail) {},
      onPointerUp: (detail) {},
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 120,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      height: 40,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: titlesOne.length,
                          itemBuilder: (context, index) {
                            return Transform.scale(
                              scale: activePositionOne == index ? 1 : .75,
                              child: GestureDetector(
                                onTap: () {
                                  activePositionOne = index;
                                  if (index == 0) {
                                    titleOneOffset = 0;
                                    pageController.animateToPage(0,
                                        duration: Duration(milliseconds: 300),
                                        curve: Curves.easeOut);
                                  } else {
                                    titleOneOffset = 60;
                                    pageController.animateToPage(1,
                                        duration: Duration(milliseconds: 300),
                                        curve: Curves.easeOut);
                                  }
                                  setState(() {});
                                },
                                child: Container(
                                  width: 60,
                                  height: 40,
                                  alignment: Alignment.center,
                                  child: Text(
                                    titlesOne[index],
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                        fontWeight: FontWeight.normal),
                                  ),
                                ),
                              ),
                            );
                          }),
                    ),
                    SizedBox(
                      height: 0,
                    ),
                    Transform.translate(
                      offset: Offset(titleOneOffset + 22, 0),
                      child: Container(
                        alignment: Alignment.centerLeft,
                        width: 18,
                        height: 2.5,
                        decoration: BoxDecoration(
                            color: Colors.orangeAccent,
                            borderRadius: BorderRadius.all(Radius.circular(2))),
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    width: 30,
                    child: Image.asset(
                      "images/img_title_search.png",
                      width: 22,
                      height: 22,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 10),
                    width: 40,
                    child: Image.asset(
                      "images/img_title_publish.png",
                      width: 22,
                      height: 22,
                    ),
                  )
                ],
              ))
            ],
          ),
          Expanded(
              child: Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                child: PageView.builder(
                    controller: pageController,
                    itemCount: 11,
                    onPageChanged: (position) {
                      print("position${position}");
                      activePosition = position;
                      if (position == 0 || position == 1) {
                        activePositionOne = position;
                      }
                      if (position == 1) {
                        print(scrollController.offset);
                        print(bgOffset);
                        if (bgOffset != 0) {
                          bgOffsetAnimation =
                              Tween<double>(begin: bgOffset, end: 0)
                                  .animate(bgOffsetAnimationController)
                                    ..addListener(() {
                                      setState(() {
                                        bgOffset = bgOffsetAnimation.value;
                                      });
                                    });
                          bgOffsetAnimationController.reset();
                          bgOffsetAnimationController.forward();
                        }
                      }
                      if (position != 0) {
                        activePositionTwo = position - 1;
//                    print("onPageChanged:" + getOffset(activePositionTwo).toString());
//                    print("onPageChanged:" +
//                        (measureTextWidth(titleList[activePositionTwo], null)).toString());
//                    print("onPageChanged:" +
//                        (MediaQuery.of(context).size.width / 2).toString());
                        if (needScrollAnimation) {
                          double scroll = ((getOffset(activePositionTwo) +
                                          (measureTextWidth(
                                                      titleList[
                                                          activePositionTwo],
                                                      null) +
                                                  30) /
                                              2) -
                                      screenWidth / 2) >
                                  0
                              ? (getOffset(activePositionTwo) +
                                      (measureTextWidth(
                                                  titleList[activePositionTwo],
                                                  null) +
                                              30) /
                                          2) -
                                  screenWidth / 2
                              : 0;
                          scrollController.animateTo(scroll,
                              duration: Duration(milliseconds: 300),
                              curve: Curves.easeOut);
                        }
                      }
                      setState(() {});
                    },
                    allowImplicitScrolling: true,
                    itemBuilder: (context, position) {
                      return pages[position];
                    }),
              ),
              Transform.translate(
                offset: Offset(
                    screenWidth -
                        (offset >= screenWidth ? screenWidth : offset),
                    0),
                child: Stack(
                  children: [
                    Container(
                      color: Colors.grey[50],
                        child: Transform.translate(
                      offset: Offset(bgOffset - scrollOffset, 0),
                      child: Container(
                        height: 40,
                        width: getOffset(titleList.length),
                        margin: EdgeInsets.only(left: 10, right: 10),
                        alignment: Alignment.centerLeft,
                        child: Image.asset("images/v4/indicator_tab_bg.9.png",
                            width: measureTextWidth(
                                    titleList[activePositionTwo], null) +
                                10
//                  height: 23,
//                  fit: BoxFit.contain,
                            ),
                      ),
                    )),
                    Container(
                      height: 40,
                      child: ListView.builder(
                          controller: scrollController,
                          scrollDirection: Axis.horizontal,
                          itemCount: titleList.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                needScrollAnimation = false;
                                Timer(Duration(milliseconds: 300), () {
                                  needScrollAnimation = true;
                                });
                                double scroll = ((getOffset(index) +
                                                (measureTextWidth(
                                                            titleList[index],
                                                            null) +
                                                        30) /
                                                    2) -
                                            screenWidth / 2) >
                                        0
                                    ? (getOffset(index) +
                                            (measureTextWidth(titleList[index],
                                                        null) +
                                                    30) /
                                                2) -
                                        screenWidth / 2
                                    : 0;
                                scrollController.animateTo(scroll,
                                    duration: Duration(milliseconds: 300),
                                    curve: Curves.easeOut);
                                pageController.animateToPage(index + 1,
                                    duration: Duration(milliseconds: 300),
                                    curve: Curves.easeOut);
                              },
                              child: Container(
                                margin: EdgeInsets.only(left: 10, right: 10),
                                height: 40,
                                padding: EdgeInsets.only(
                                    left: 5, right: 5, top: 8, bottom: 5),
                                child: Text(
                                  titleList[index],
                                  style: TextStyle(
                                      color: activePositionTwo == index
                                          ? Colors.black
                                          : Colors.grey),
                                ),
                              ),
                            );
                          }),
                    ),
                  ],
                ),
              ),
            ],
          ))
        ],
      ),
    );
  }
}
