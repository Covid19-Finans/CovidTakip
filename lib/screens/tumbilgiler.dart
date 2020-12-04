import 'package:covidapp/models/covid.dart';
import 'package:covidapp/models/covidlist.dart';
import 'package:covidapp/models/lastdata.dart';
import 'package:covidapp/widgets/details.dart';
import 'package:flutter/material.dart';

class TumBilgiler extends StatelessWidget {
  List<CovidList> bilgiler;
  TumBilgiler({@required this.bilgiler});

  @override
  Widget build(BuildContext context) {
    var toplam = bilgiler.length;
    var diziindex = toplam - 1;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
      ),
      body: ListView.builder(
        itemCount: toplam,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            padding: EdgeInsets.only(top: 4),
            color: Colors.red[100],
            height: MediaQuery.of(context).size.height * 1.5 / 10,
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [CovidDetails(data: bilgiler[diziindex - index])],
            ),
          );
        },
      ),
    );
  }
}
