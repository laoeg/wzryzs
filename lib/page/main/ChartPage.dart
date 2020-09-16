import 'package:flutter/cupertino.dart';

class ChartPage extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return StateChartPage();
  }


}

class StateChartPage extends State<ChartPage>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      alignment: Alignment.center,
      child: Text("聊天"),
    );
  }

}