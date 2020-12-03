import 'package:covidapp/models/covid.dart';
import 'package:covidapp/wisdgets/table_row.dart';
import 'package:flutter/material.dart';

class TumBilgiler extends StatelessWidget {
  List<Covid> bilgiler;
  TumBilgiler({@required this.bilgiler});

  @override
  Widget build(BuildContext context) {
    var toplam = bilgiler.length;
    var diziindex = toplam - 1;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
      ),
      body: Container(
        color: Colors.red,
        height: MediaQuery.of(context).size.height,
        child: ListView.builder(
          itemCount: toplam,
          itemBuilder: (BuildContext context, int index) {
            int value = index + 1;

            return Container(
              height: MediaQuery.of(context).size.height * 1.2 / 10,
              width: MediaQuery.of(context).size.width * 9.50 / 10,
              margin: EdgeInsets.only(
                  bottom: MediaQuery.of(context).size.height * 0.10 / 10),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.black),
              ),
              child: Column(
                children: [
                  Container(
                    child: Text("${bilgiler[diziindex - index].date}"),
                  ),
                  TableData(
                      text: "Vefat Sayısı",
                      sondeger: bilgiler[diziindex - index].deaths,
                      dunkudeger: index >= toplam - 1
                          ? 0
                          : bilgiler[diziindex - value].deaths),
                  TableData(
                      text: "İyileşen Sayısı",
                      sondeger: bilgiler[diziindex - index].recovered,
                      dunkudeger: index >= toplam - 1
                          ? 0
                          : bilgiler[diziindex - value].recovered),
                  TableData(
                      text: "Aktif Hasta Sayısı Sayısı",
                      sondeger: bilgiler[diziindex - index].active,
                      dunkudeger: index >= toplam - 1
                          ? 0
                          : 0 /*bilgiler[diziindex - value].active*/),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
