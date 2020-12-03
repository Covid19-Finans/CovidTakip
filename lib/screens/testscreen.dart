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
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                        child: Text(
                      "${sorular[index].soru}",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    )),
                    Column(
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height * 2 / 10,
                          width: MediaQuery.of(context).size.width * 9.75 / 10,
                          child: RaisedButton(
                            elevation: 20,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30)),
                            color: Colors.red,
                            onPressed: () {},
                            child: Text(
                              "Evet",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10),
                          height: MediaQuery.of(context).size.height * 2 / 10,
                          width: MediaQuery.of(context).size.width * 9.75 / 10,
                          child: RaisedButton(
                            elevation: 20,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30)),
                            color: Colors.white,
                            onPressed: () {},
                            child: Text(
                              "Hayır",
                              style: TextStyle(color: Colors.red),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 2 / 10,
                      width: MediaQuery.of(context).size.width,
                      color: Colors.red,
                    )
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
