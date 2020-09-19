import 'dart:async';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wzryzs/page/main/pageView/FavouritePage.dart';

class NewsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return StateNewsPage();
  }
}

class StateNewsPage extends State<NewsPage> with TickerProviderStateMixin {
  double offset = 60;
  double moveDx = 0;

  PageController pageController = new PageController(initialPage: 1);

  int activePosintion = 1;

  NewsPageView newsPageView = NewsPageView();

  List<Widget> pages = [FavouritePage(), NewsPageView()];

  Animation animation;
  AnimationController animationController;

  double startDx = 0;
  double stopDx = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pageController.addListener(() {
      offset = pageController.offset / MediaQuery.of(context).size.width * 60;
      setState(() {});
    });
    animationController =
        AnimationController(duration: Duration(milliseconds: 200), vsync: this);
    animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        if (offset == 0) {
          activePosintion = 1;
        } else if (offset == 60) {
          activePosintion = 0;
        }
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Transform.scale(
                      scale: activePosintion == 0 ? 1 : .75,
                      child: GestureDetector(
                        onTap: () {
                          pageController.jumpToPage(0);
                          setState(() {
                            activePosintion = 0;
                            offset = 0;
                          });
                        },
                        child: Container(
                          width: 60,
                          alignment: Alignment.center,
                          child: Text(
                            "关注",
                            style: TextStyle(
                                decoration: TextDecoration.none,
                                color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                    Transform.scale(
                      scale: activePosintion == 1 ? 1 : .75,
                      child: GestureDetector(
                        onTap: () {
                          pageController.jumpToPage(1);
                          setState(() {
                            activePosintion = 1;
                            offset = 60;
                          });
                        },
                        child: Container(
                          width: 60,
                          alignment: Alignment.center,
                          child: Text(
                            "推荐",
                            style: TextStyle(
                                decoration: TextDecoration.none,
                                color: Colors.black),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    Container(
                      width: 40,
                      child: Image.asset(
                        "images/img_title_search.png",
                        width: 22,
                        height: 22,
                      ),
                    ),
                    Container(
                      width: 40,
                      child: Image.asset(
                        "images/img_title_publish.png",
                        width: 22,
                        height: 22,
                      ),
                    )
                  ],
                )
              ],
            ),
            SizedBox(
              height: 8,
            ),
            Transform.translate(
              offset: Offset(offset + 22, 0),
              child: Container(
                alignment: Alignment.centerLeft,
                width: 16,
                height: 3,
                decoration: BoxDecoration(
                    color: Colors.orangeAccent,
                    borderRadius: BorderRadius.all(Radius.circular(2))),
              ),
            )
          ],
        ),
      ),
      body: PageView.builder(
          controller: pageController,
          itemCount: pages.length,
          itemBuilder: (context, index) {
            return pages[index];
          }),
//      body: Listener(
////        onPointerDown: (event){
////          startDx = event.localPosition.dx;
////        },
////        onPointerMove: (event){
////          stopDx = event.localPosition.dx;
////          moveDx = event.delta.dx;
//////          print(moveDx);
////          setState(() {
////
////          });
////          if(newsPageView.avtivePostionToOutside!=0&&activePosintion==1){
////            return;
////          }
////          print("offset:"+offset.toString());
////
////
////          offset+=event.delta.dx/MediaQuery.of(context).size.width*60;
////          if(offset>=60){
////            offset=60;
////            setState(() {
////
////            });
////            return;
////          }
////          if(offset<=0){
////            offset = 0 ;
////            setState(() {
////
////            });
////            return;
////          }
//////          print("1111:"+event.delta.dx.toString());
////
////        },
////        onPointerUp: (event){
////          print("new_ac:"+offset.toString());
////          if(newsPageView.avtivePostionToOutside!=0){
////            return;
////          }
////          double offsetDx = stopDx-startDx;
////          print("dddd:"+offsetDx.toString());
////          if(offsetDx>0){//从左向右滑动
////            offsetDx = offsetDx.abs();
////            if(offsetDx>50){
////              animation = Tween<double>(begin: offset,end: 60).animate(animationController)..addListener(() {
////                setState(() {
////                  offset = animation.value;
////                });
////              });
////              animationController.reset();
////              animationController.forward();
////            }else{
////              animation = Tween<double>(begin: offset,end: 0).animate(animationController)..addListener(() {
////                setState(() {
////                  offset = animation.value;
////                });
////              });
////              animationController.reset();
////              animationController.forward();
////            }
////          }else{//从右向左滑动
////            offsetDx = offsetDx.abs();
////            if(activePosintion==1){
////              return;
////            }
////            if(offsetDx>50){
////              animation = Tween<double>(begin: offset,end: 0).animate(animationController)..addListener(() {
////                setState(() {
////                  offset = animation.value;
////                });
////              });
////              animationController.reset();
////              animationController.forward();
////            }else{
////              animation = Tween<double>(begin: offset,end: 60).animate(animationController)..addListener(() {
////                setState(() {
////                  offset = animation.value;
////                });
////              });
////              animationController.reset();
////              animationController.forward();
////            }
////          }
////        },
////        child: AbsorbPointer(
////          absorbing: newsPageView.avtivePostionToOutside==0&&(activePosintion==1?moveDx>0:true)&&activePosintion==0,
////          child: activePosintion==0?FavouritePage():newsPageView,
////        ),
//      ),
    );
  }
}

class NewsPageView extends StatefulWidget {
  int _avtivePostionToOutside = 0;

  int get avtivePostionToOutside => _avtivePostionToOutside;

  set avtivePostionToOutside(int value) {
    _avtivePostionToOutside = value;
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return StateNewsPageView();
  }
}

class StateNewsPageView extends State<NewsPageView>
    with TickerProviderStateMixin {
  int tempPosition = 0;
  int activePosition = 0;
  int lastActivePosition = 0;
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
  DefaultTextStyle defaultTextStyle = null;

  ScrollController scrollController = ScrollController();

  PageController pageController = PageController();

  double scrollOffset = 0;

  AnimationController animationController;
  Animation animation;
  double bgOffset = 0;

  double moveDx = 0;
  double offset = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pageController.addListener(() {
//      print("pc:" + pageController.offset.toString());
    });
    animationController =
        AnimationController(duration: Duration(milliseconds: 300), vsync: this);
    scrollController
      ..addListener(() {
        setState(() {
          scrollOffset = scrollController.offset;
        });
//        print("scroll:" + scrollController.offset.toString());
      });
    pageController.addListener(() {
      double titleWidth = 0;
      if (pageController.offset > 0) {
        titleWidth = getOffset(activePosition + 1) - getOffset(activePosition);
      } else {
        titleWidth = getOffset(activePosition) - getOffset(activePosition - 1);
      }
//      print("titleWidth:" + titleWidth.toString());
      setState(() {
        bgOffset = titleWidth *
                (pageController.offset % MediaQuery.of(context).size.width) /
                MediaQuery.of(context).size.width +
            getOffset(
                (pageController.offset ~/ MediaQuery.of(context).size.width));
      });
//      print("page:" + pageController.offset.toString());
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
    if (defaultTextStyle == null) {
      defaultTextStyle = DefaultTextStyle.of(context);
    }
    // TODO: implement build
    return Column(
      children: [
        Stack(
          children: [
            Container(
                child: Transform.translate(
              offset: Offset(bgOffset - scrollOffset, 0),
              child: Container(
                height: 40,
                width: getOffset(titleList.length),
                margin: EdgeInsets.only(left: 10, right: 10),
                alignment: Alignment.centerLeft,
                child: Image.asset(
                  "images/v4/indicator_tab_bg.9.png",
                  width: measureTextWidth(titleList[activePosition], null) + 10,
//                  height: 23,
//                  fit: BoxFit.contain,
                ),
              ),
            )),
            Container(
//              color: Colors.white,
              width: MediaQuery.of(context).size.width,
              height: 40,
              child: ListView.builder(
                  controller: scrollController,
                  scrollDirection: Axis.horizontal,
                  itemCount: titleList.length,
                  itemBuilder: (BuildContext context, int position) {
                    return GestureDetector(
                      onTap: () {
                        pageController.jumpToPage(position);
//                        pageController.animateToPage(activePosition,
//                            duration: Duration(milliseconds: 200),
//                            curve: Curves.easeOut);
                        print("dddddd");
                        print(lastActivePosition);
                        print(position);
                        print(getOffset(lastActivePosition));
                        print(getOffset(position));
                        animation = Tween<double>(
                                begin: getOffset(lastActivePosition),
                                end: getOffset(position))
                            .animate(animationController)
                              ..addListener(() {
                                bgOffset = animation.value;
                                setState(() {});
                              });
                        animationController.reset();
                        animationController.forward();
                        Timer(Duration(milliseconds: 300), () {
                          lastActivePosition = position;
                          activePosition = position;
                          widget._avtivePostionToOutside = position;
                          setState(() {});
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.only(left: 10, right: 10),
//                        decoration: activePosition==position?BoxDecoration(
//                            image: DecorationImage(
//                              image: AssetImage("images/v4/indicator_tab_bg.9.png"),
////                      fit: BoxFit.fitWidth
//                            )
//                        ):BoxDecoration(),
                        height: 40,
//                  alignment: Alignment.center,
                        padding: EdgeInsets.only(
                            left: 5, right: 5, top: 8, bottom: 5),
                        child: Text(
                          titleList[position],
                          style: TextStyle(
                              color: activePosition == position
                                  ? Colors.black
                                  : Colors.grey),
                        ),
                      ),
                    );
                  }),
            ),
          ],
        ),
        Expanded(
//          width: MediaQuery.of(context).size.width,width
//          height:MediaQuery.of(context).size.height,
          child: Listener(
            onPointerDown: (detail) {
              offset = 0;
            },
            onPointerMove: (detail) {
              offset += detail.delta.dx;
              moveDx = detail.delta.dx;
              setState(() {});
            },
            onPointerUp: (detail) {
              if (offset < 0) {
                offset = offset.abs();
                if (offset % MediaQuery.of(context).size.width >
                    MediaQuery.of(context).size.width / 5) {
                  pageController.animateToPage(activePosition + 1,
                      duration: Duration(milliseconds: 300),
                      curve: Curves.easeOut);
                } else {
                  pageController.animateToPage(activePosition,
                      duration: Duration(milliseconds: 300),
                      curve: Curves.easeOut);
                }
              } else {
                offset = offset.abs();
                if (offset % MediaQuery.of(context).size.width >
                    MediaQuery.of(context).size.width / 5) {
                  pageController.animateToPage(activePosition - 1,
                      duration: Duration(milliseconds: 300),
                      curve: Curves.easeOut);
                } else {
                  pageController.animateToPage(activePosition,
                      duration: Duration(milliseconds: 300),
                      curve: Curves.easeOut);
                }
              }

            },
            child: PageView.builder(
                physics: activePosition == 0 && moveDx > 0
                    ? NeverScrollableScrollPhysics()
                    : null,
                pageSnapping: false,
                onPageChanged: (position) {
                  print("onPageChanged:"+bgOffset.toString());
                  print("onPageChanged:"+(getOffset(position)/2).toString());
                  print("onPageChanged:"+(MediaQuery.of(context).size.width / 2).toString());
                  double scroll =  (bgOffset +getOffset(position-1)/2)>
                      (MediaQuery.of(context).size.width / 2)
                      ? (bgOffset+getOffset(position-1)/2  -
                      MediaQuery.of(context).size.width / 2)
                      : 0;
                  print("onPageChanged:"+scroll.toString());
                  print("onPageChanged:"+scrollController.offset.toString());
                  scrollController.animateTo(
                      scroll-scrollController.offset,
                      duration: Duration(milliseconds: 200),
                      curve: Curves.easeOut);
//                animation = Tween<double>(
//                    begin: getOffset(lastActivePosition),
//                    end: getOffset(position))
//                    .animate(animationController)
//                  ..addListener(() {
//                    print(
//                        "animation:" + animation.value.toString());
//                    bgOffset = animation.value;
//                    setState(() {});
//                  });
//                animationController.reset();
//                animationController.forward();
//                Timer(Duration(milliseconds: 300), () {
//                  lastActivePosition = position;
//                  activePosition = position;
//                  setState(() {});
//                });
                  print("onPageChanged:"+scrollController.offset.toString());
                  setState(() {
                    lastActivePosition = activePosition;
                    activePosition = position;
                    widget._avtivePostionToOutside = position;
                  });
                },
                controller: pageController,
                itemCount: titleList.length,
                itemBuilder: (context, index) {
                  return Container(
                    alignment: Alignment.center,
                    child: Text(titleList[index]),
                  );
                }),
          ),
        )
      ],
    );
  }
}
