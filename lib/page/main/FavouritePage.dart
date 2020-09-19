import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FavouritePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return StateFavouritePage();
  }
}

class StateFavouritePage extends State<FavouritePage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return Container(
//          margin: EdgeInsets.only(top: 40),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.all(10),
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 10,bottom: 15),
                      child: Row(
                        children: [
                          Column(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.all(Radius.circular(25)),
                                child: Image.asset("images/v4/img_battle_tab_smoba.png",width: 40,height: 40,),
                              ),
                              SizedBox(height: 5,),
                              Text("王者荣耀",style: TextStyle(fontSize: 11,color: Colors.black),)
                            ],
                          ),
                          SizedBox(width: 15,),
                          Column(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.all(Radius.circular(25)),
                                child: Image.asset("images/v4/add_account.png",width: 40,height: 40,),
                              ),
                              SizedBox(height: 5,),
                              Text("关注更多",style: TextStyle(fontSize: 11,color: Colors.black),)
                            ],
                          )
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(25)),
                          child: Image.asset("images/v4/img_battle_tab_smoba.png",width: 30,height: 30,),
                        ),
                        SizedBox(width: 5,),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("王者荣耀",style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.w500),),
                                Image.asset("images/v4/smoba_male.png",width: 15,height: 15,),
                                Image.asset("images/v4/hotpot_select_icon.png",width: 15,height: 15,),
                              ],
                            ),
                            SizedBox(height: 5,),
                            Text("17小时前",style: TextStyle(fontSize: 10,color: Colors.grey),)
                          ],
                        )
                      ],
                    ),
                    SizedBox(height: 5,),
                    Container(
                      height: 70,
                      padding: EdgeInsets.only(left: 5),
                      decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.all(Radius.circular(4))),
                      child: Row(
                        children: [
                          Expanded(child: Text("9月17日体验服停机更新公告",style: TextStyle(color: Colors.black,fontSize: 14,fontWeight: FontWeight.w500),)),
                          Image.asset("images/v4/search_empty.webp",height: 70,),
                        ],
                      ),
                    ),
                    SizedBox(height: 10,),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset("images/v4/img_common_like_gray.png",width: 15,),
                        Text("455",style: TextStyle(color: Colors.grey,fontSize: 10),),
                        SizedBox(width: 20,),
                        Image.asset("images/v4/img_common_comment.png",width: 15,),
                        Text("455",style: TextStyle(color: Colors.grey,fontSize: 10),),
                        SizedBox(width: 20,),
                        Image.asset("images/v4/img_common_share.png",width: 15,),
                        Text("455",style: TextStyle(color: Colors.grey,fontSize: 10),),
                      ],
                    ),

                  ],
                ),
              ),
              Container(
                height: 3,
                width: MediaQuery.of(context).size.width,
                color: Colors.grey[200],
              )
            ],
          ),
        );
      },
    );
  }
}
