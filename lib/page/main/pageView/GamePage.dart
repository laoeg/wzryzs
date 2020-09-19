import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GamePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return StateGamePage();
  }
}

class StateGamePage extends State<GamePage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return NestedScrollView(
        headerSliverBuilder: (contex,scrolled){
          return <Widget>[SliverAppBar(
            expandedHeight: 230,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text("ddd"),
            ),
          )];
        },
        body: Center(
          child: Text("赛事"),
        ));
  }
}
