import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return StateNewsPage();
  }
}

class StateNewsPage extends State<NewsPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
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
                      scale: .75,
                      child: Container(
                        width: 60,
                        alignment: Alignment.center,
                        child: Text(
                          "关注",
                          style: TextStyle(
                              decoration: TextDecoration.none, color: Colors.black),
                        ),
                      ),
                    ),
                    Transform.scale(
                      scale: 1,
                      child: Container(
                        width: 60,
                        alignment: Alignment.center,
                        child: Text(
                          "推荐",
                          style: TextStyle(
                              decoration: TextDecoration.none, color: Colors.black),
                        ),
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    Container(
                      width: 40,
                      child: Image.asset("images/img_title_search.png",width: 22,height: 22,),
                    ),
                    Container(
                      width: 40,
                      child:  Image.asset("images/img_title_publish.png",width: 22,height: 22,),
                    )
                  ],
                )
              ],
            ),
            SizedBox(
              height: 8,
            ),
            Transform.translate(
              offset: Offset(82, 0),
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
//      body: ,
    );
  }
}
