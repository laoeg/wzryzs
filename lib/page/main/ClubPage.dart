import 'package:flutter/cupertino.dart';

class ClubPage extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return StateClubPage();
  }


}

class StateClubPage extends State<ClubPage>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      alignment: Alignment.center,
      child: Text("社区"),
    );
  }

}