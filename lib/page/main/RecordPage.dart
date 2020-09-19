import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RecordPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return StateRecordPage();
  }
}

class StateRecordPage extends State<RecordPage>
    with AutomaticKeepAliveClientMixin {
  String text = "9月王者荣耀先锋团招募公告9月王者荣耀"; //这个标题得限制字数
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return CustomScrollView(
      shrinkWrap: true,
      slivers: <Widget>[
        SliverPadding(
          padding: EdgeInsets.all(0),
          sliver: SliverList(
              delegate: new SliverChildListDelegate(<Widget>[
            SizedBox(
              height: 40,
            ),
            Container(
              height: 150,
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.only(left: 10, right: 10),
              // 需要自动滚动的加个定时器封装一下
              child: PageView.builder(
                  itemCount: 5,
//              controller: PageController(viewportFraction: .8),
                  itemBuilder: (context, index) {
                    return ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          "images/v4/img_share_header_chess.webp",
                          width: MediaQuery.of(context).size.width - 20,
                          fit: BoxFit.fitHeight,
                        ));
                  }),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              margin: EdgeInsets.only(left: 10, right: 10),
              child: ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 50,
                  itemBuilder: (context, index) {
                    return index % 8 == 0 && index != 0
                        ? Container(
                            margin: EdgeInsets.only(
                              top: 10,
                            ),
                            child: Column(
                              children: [
                                Container(
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          ClipRRect(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(25)),
                                            child: Image.asset(
                                              "images/v4/img_battle_tab_smoba.png",
                                              width: 30,
                                              height: 30,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "王者荣耀",
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                  Image.asset(
                                                    "images/v4/smoba_male.png",
                                                    width: 15,
                                                    height: 15,
                                                  ),
                                                  Image.asset(
                                                    "images/v4/hotpot_select_icon.png",
                                                    width: 15,
                                                    height: 15,
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                "17小时前",
                                                style: TextStyle(
                                                    fontSize: 10,
                                                    color: Colors.grey),
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Container(
                                        height: 70,
                                        padding: EdgeInsets.only(left: 5),
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(4))),
                                        child: Row(
                                          children: [
                                            Expanded(
                                                child: Text(
                                              "9月17日体验服停机更新公告",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w500),
                                            )),
                                            Image.asset(
                                              "images/v4/search_empty.webp",
                                              height: 70,
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            "社区精选",
                                            style: TextStyle(
                                                fontSize: 10,
                                                color: Colors.grey),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Image.asset(
                                            "images/v4/img_search_visible.png",
                                            width: 12,
                                          ),
                                          SizedBox(
                                            width: 3,
                                          ),
                                          Text(
                                            "17.9万",
                                            style: TextStyle(
                                                fontSize: 8,
                                                color: Colors.grey),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Image.asset(
                                            "images/v4/info_comment_num.png",
                                            width: 12,
                                          ),
                                          SizedBox(
                                            width: 3,
                                          ),
                                          Text(
                                            "6745",
                                            style: TextStyle(
                                                fontSize: 8,
                                                color: Colors.grey),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 10),
                                  height: 1,
                                  width: MediaQuery.of(context).size.width,
                                  color: Colors.grey[200],
                                )
                              ],
                            ),
                          )
                        : Container(
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        width: 1, color: Colors.grey[200]))),
                            padding: EdgeInsets.only(bottom: 10, top: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                    child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Visibility(
                                          visible: index < 4,
                                          child: Image.asset(
                                            "images/v4/img_circle_top.png",
                                            height: 18,
                                          ),
                                        ),
                                        Visibility(
                                          visible: index < 4,
                                          child: SizedBox(
                                            width: 5,
                                          ),
                                        ),
                                        Expanded(
                                            child: Text(
                                          text.length > 12
                                              ? text.substring(0, 12)
                                              : text.substring(0, text.length),
                                          style: TextStyle(
                                              height: 1.2,
                                              fontSize: 15,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w500),
                                        ))
                                      ],
                                    ),
                                    SizedBox(
                                      height: 2,
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width -
                                          150,
                                      child: Text(
                                        text.length > 12
                                            ? text.substring(12)
                                            : "",
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            height: 1.2,
                                            fontSize: 15,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "王者荣耀",
                                          style: TextStyle(
                                              fontSize: 10, color: Colors.grey),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Image.asset(
                                          "images/v4/img_search_visible.png",
                                          width: 12,
                                        ),
                                        SizedBox(
                                          width: 3,
                                        ),
                                        Text(
                                          "17.9万",
                                          style: TextStyle(
                                              fontSize: 8, color: Colors.grey),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Image.asset(
                                          "images/v4/info_comment_num.png",
                                          width: 12,
                                        ),
                                        SizedBox(
                                          width: 3,
                                        ),
                                        Text(
                                          "6745",
                                          style: TextStyle(
                                              fontSize: 8, color: Colors.grey),
                                        ),
                                      ],
                                    )
                                  ],
                                )),
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(5),
                                  child: Image.asset(
                                    "images/v4/match_page_bg_recommend_schedule.webp",
                                    width: 100,
                                  ),
                                )
                              ],
                            ),
                          );
                  }),
            )
          ])),
        )
      ],
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
