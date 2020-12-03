import 'package:covidapp/models/covidlist.dart';
import 'package:covidapp/models/lastdata.dart';
import 'package:covidapp/screens/tumbilgiler.dart';
import 'package:covidapp/wisdgets/headerwidget.dart';
import 'package:covidapp/wisdgets/table_row.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(backgroundColor: Colors.white, body: MyApp())));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Future<List<CovidList>> covid() async {
    var url =
        "https://api.apify.com/v2/datasets/LYeOfHQwsv7FsfdGV/items?format=json&clean=1";
    var response = await http.get(url);
    //debugPrint(response.body);
    var jsonResponse = json.decode(response.body);

    List<CovidList> datas = [];
    for (var u in jsonResponse) {
      CovidList covid = CovidList.fromJson(u);
      datas.add(covid);
    }
    int range = datas.length - 31;
    datas.removeRange(0, range);

    return datas;
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      HeaderWidget(),
      SingleChildScrollView(
        child: Container(
          color: Colors.white,
          height: MediaQuery.of(context).size.height * 5.30 / 10,
          child: FutureBuilder(
              future: covid(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  var son = snapshot.data.length;
                  return Column(
                    children: <Widget>[
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.20 / 10,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 8.50 / 10,
                        height: MediaQuery.of(context).size.height * 3.90 / 10,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: Colors.red),
                            color: Colors.white),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(
                                      top: MediaQuery.of(context).size.height *
                                          0.10 /
                                          10),
                                  color: Colors.grey,
                                  width: MediaQuery.of(context).size.width *
                                      7 /
                                      10,
                                  height: MediaQuery.of(context).size.height *
                                      1.85 /
                                      10,
                                ),
                              ],
                            ),
                            Text(
                              "Günlük Vaka Sayısı:${snapshot.data[son - 1].dailyInfected}",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                            //////////////////////////////// VEFAT SAYISI
                            // TableData(
                            //     text: "Vefat Sayısı",
                            //     sondeger: snapshot.data[son - 1].deaths,
                            //     dunkudeger: snapshot.data[son - 2].deaths),
                            // /////////////////////////////// İYİLEŞEN SAYISI
                            // TableData(
                            //     text: "İyileşen Sayısı",
                            //     sondeger: snapshot.data[son - 1].recovered,
                            //     dunkudeger: snapshot.data[son - 2].recovered),

                            // ////////////////////////////////////////////// YENİ HASTA SAYISI
                            // ///
                            // TableData(
                            //     text: "Hastalanan Sayısı",
                            //     sondeger: snapshot.data[son - 1].active,
                            //     dunkudeger: snapshot.data[son - 2].active),

                            RaisedButton(
                              color: Colors.red,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => TumBilgiler(
                                            bilgiler: snapshot.data)));
                              },
                              child: Text(
                                "Günlük Veriler",
                                style: TextStyle(color: Colors.white),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  );
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              }),
        ),
      ),
    ]);
  }
}

// ListView.builder(
//                   itemCount: snapshot.data.length,
//                   itemBuilder: (context, index) {
//                     return Container(
//                       margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
//                       height: MediaQuery.of(context).size.height * 2.50 / 10,
//                       decoration: BoxDecoration(
//                           color: Colors.white,
//                           borderRadius: BorderRadius.circular(20),
//                           border: Border.all(color: Colors.red)),
//                       child: Column(
//                         children: [],
//                       ),
//                     );
//                   },
//                 );
// Future<List<Covid>> covid() async {
//     var url = "https://api.covid19api.com/dayone/country/turkey";
//     var response = await http.get(url);
//     var jsonResponse = json.decode(response.body);
//     List<Covid> datas = [];
//     for (var u in jsonResponse) {
//       Covid covid = Covid.fromJson(u);
//       datas.add(covid);
//     }
//     return datas;
