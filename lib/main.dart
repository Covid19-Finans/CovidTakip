import 'package:covidapp/models/covidlist.dart';
import 'package:covidapp/screens/tumbilgiler.dart';
import 'package:covidapp/widgets/headerwidget.dart';
import 'package:covidapp/widgets/stats.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false, home: Scaffold(body: MyApp())));
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
          height: MediaQuery.of(context).size.height * 6 / 10,
          child: FutureBuilder(
              future: covid(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  var son = snapshot.data.length;
                  return Column(
                    children: <Widget>[
                      StatsGrid(
                        data: snapshot.data[son - 1],
                      ),
                      Column(
                        children: [
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
                              "30 Günlük Veriler",
                              style: TextStyle(color: Colors.white),
                            ),
                          )
                        ],
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
