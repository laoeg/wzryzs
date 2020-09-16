import 'package:flutter/cupertino.dart';

class RecordPage extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return StateRecordPage();
  }


}

class StateRecordPage extends State<RecordPage>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      alignment: Alignment.center,
      child: Text("战绩"),
    );
  }

}