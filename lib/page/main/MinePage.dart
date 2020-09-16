import 'package:flutter/cupertino.dart';

class MinePage extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return StateMinePage();
  }


}

class StateMinePage extends State<MinePage>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      alignment: Alignment.center,
      child: Text("我"),
    );
  }

}