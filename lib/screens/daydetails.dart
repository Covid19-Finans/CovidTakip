import 'package:covidapp/models/covidlist.dart';

import 'package:covidapp/widgets/statcard.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DayDetails extends StatelessWidget {
  CovidList data;

  DayDetails({@required this.data});
  @override
  Widget build(BuildContext context) {
    DateTime tarih = data.lastUpdatedAtApify;
    String tarihText = "Tarih: " +
        tarih.day.toString() +
        "." +
        tarih.month.toString() +
        "." +
        tarih.year.toString();
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.red, title: Text(tarihText)),
      body: Container(
        color: Colors.red[100],
        child: Column(
          children: [
            Flexible(
                child: Row(
              children: [
                BuildStatCard(
                  color: Colors.white,
                  count: data.dailyInfected,
                  title: 'Günlük Vaka Sayısı',
                  onBorder: true,
                ),
              ],
            )),
            Flexible(
                child: Row(
              children: [
                BuildStatCard(
                  color: Colors.white,
                  count: data.dailyTested,
                  title: 'Günlük Test Sayısı',
                  onBorder: true,
                ),
                BuildStatCard(
                  color: Colors.white,
                  count: data.dailyDeceased,
                  title: 'Günlük Ölüm Sayısı',
                  onBorder: true,
                )
              ],
            )),
            Flexible(
                child: Row(
              children: [
                BuildStatCard(
                  color: Colors.white,
                  count: data.dailyRecovered,
                  title: 'Günlük İyileşen Sayısı',
                  onBorder: true,
                ),
                BuildStatCard(
                  color: Colors.white,
                  count: data.infected,
                  title: 'Toplam Vaka Sayısı',
                  onBorder: true,
                )
              ],
            )),
            Flexible(
                child: Row(
              children: [
                BuildStatCard(
                  color: Colors.white,
                  count: data.tested,
                  title: 'Toplam Test Sayısı',
                  onBorder: true,
                ),
                BuildStatCard(
                  color: Colors.white,
                  count: data.recovered,
                  title: 'Toplam İyileşen Sayısı',
                  onBorder: true,
                )
              ],
            )),
            Flexible(
                child: Row(
              children: [
                BuildStatCard(
                  color: Colors.white,
                  count: data.deceased,
                  title: 'Toplam Ölüm Sayısı',
                  onBorder: true,
                ),
                BuildStatCard(
                  color: Colors.white,
                  count: data.critical,
                  title: 'Ağır Hasta Sayısı',
                  onBorder: true,
                )
              ],
            ))
          ],
        ),
      ),
    );
  }
}
