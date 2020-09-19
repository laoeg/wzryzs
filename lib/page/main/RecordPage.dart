import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RecordPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return StateRecordPage();
  }
}

class StateRecordPage extends State<RecordPage> with AutomaticKeepAliveClientMixin {


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
                SizedBox(height: 40,),
                Container(
                  height: 150,
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.only(left: 10, right: 10),
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
                        return Container(
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
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                        MainAxisAlignment.center,
                                        children: [
                                          Image.asset(
                                            "images/v4/img_circle_top.png",
                                            height: 18,
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Expanded(
                                              child: Text(
                                                "9月王者荣耀先锋团招募公",
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
                                      Text(
                                        "告",
                                        style: TextStyle(
                                            height: 1.2,
                                            fontSize: 15,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            "王者荣耀",
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
