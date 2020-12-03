import 'package:flutter/material.dart';

class TableData extends StatelessWidget {
  int sondeger;
  int dunkudeger;
  String text;

  TableData({@required this.text, @required this.sondeger});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 7 / 10,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        //borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        "$text: $sondeger",
        textAlign: TextAlign.left,
      ),
    );
  }
}
