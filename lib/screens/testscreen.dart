import 'package:flutter/material.dart';

import 'dart:convert' as convert;

class Test extends StatefulWidget {
  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  int index = 1;
  Future<List<Soru>> getsoru() async {
    var response = await DefaultAssetBundle.of(context)
        .loadString("lib/assets/sorular.json");
    var jsonReponse = convert.json.decode(response);

    List<Soru> sorular = [];
    for (Map<String, dynamic> data in jsonReponse) {
      Soru soru = Soru.fromJson(data);
      sorular.add(soru);
    }
    return sorular;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
      ),
      body: Container(
        child: FutureBuilder(
          future: getsoru(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<Soru> sorular = snapshot.data;
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.40 / 10),
                      height: MediaQuery.of(context).size.height * 8 / 10,
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Container(
                              width: MediaQuery.of(context).size.width * 9 / 10,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 60),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(color: Colors.red, width: 4),
                              ),
                              child: Text(
                                "${sorular[index].soru}",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                  height: MediaQuery.of(context).size.height *
                                      3 /
                                      10,
                                  width: MediaQuery.of(context).size.width *
                                      4.50 /
                                      10,
                                  child: RaisedButton(
                                    elevation: 20,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(30)),
                                    color: Colors.red,
                                    onPressed: () {
                                      setState(() {
                                        if (index == 10) {
                                        } else {
                                          index = index + 1;
                                        }
                                      });
                                    },
                                    child: Text(
                                      "Evet",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 10),
                                  height: MediaQuery.of(context).size.height *
                                      3 /
                                      10,
                                  width: MediaQuery.of(context).size.width *
                                      4.50 /
                                      10,
                                  child: RaisedButton(
                                    elevation: 20,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(30)),
                                    color: Colors.white,
                                    onPressed: () {
                                      if (index == 10) {
                                      } else {
                                        index = index + 1;
                                      }
                                    },
                                    child: Text(
                                      "Hayır",
                                      style: TextStyle(color: Colors.red),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}

class Soru {
  String soru;

  Soru.fromJson(Map<String, dynamic> json) {
    soru = json['soru'];
  }
}
