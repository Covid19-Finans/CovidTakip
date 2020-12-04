import 'package:covidapp/models/covidlist.dart';
import 'package:flutter/material.dart';
import 'statcard.dart';

class StatsGrid extends StatelessWidget {
  CovidList data;
  StatsGrid({@required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.4,
      child: Column(
        children: <Widget>[
          Flexible(
              child: Row(
            children: [
              BuildStatCard(
                title: 'Günlük Vaka',
                count: data.dailyInfected,
                color: Colors.blue,
              ),
            ],
          )),
          Flexible(
            child: Row(
              children: <Widget>[
                BuildStatCard(
                    title: 'Test', count: data.tested, color: Colors.grey),
                BuildStatCard(
                    title: 'Hasta', color: Colors.orange, count: data.infected),
              ],
            ),
          ),
          Flexible(
            child: Row(
              children: <Widget>[
                BuildStatCard(
                    title: 'İyileşenler',
                    count: data.recovered,
                    color: Colors.green),
                BuildStatCard(
                    title: 'Ölüm', count: data.deceased, color: Colors.red),
                BuildStatCard(
                    title: 'Ağır', count: data.critical, color: Colors.purple),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
