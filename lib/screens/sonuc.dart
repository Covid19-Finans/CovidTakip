import 'package:flutter/material.dart';

class SonucSayfa extends StatelessWidget {
  String text;
  SonucSayfa({this.text});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
      ),
      body: Container(
        child: Center(
          child: Text(text),
        ),
      ),
    );
  }
}
