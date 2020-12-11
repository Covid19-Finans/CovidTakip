import 'package:covidapp/models/covidlist.dart';
import 'package:flutter/material.dart';
//import 'package:google_fonts/google_fonts.dart';
import '../styles/colorandstyles.dart';
import 'counter.dart';

class CovidDetails extends StatelessWidget {
  CovidList data;

  CovidDetails({@required this.data});

  @override
  Widget build(BuildContext context) {
    DateTime tarih = data.lastUpdatedAtApify;
    double width = MediaQuery.of(context).size.width;

    return Container(
      padding: EdgeInsets.all(width * 0.015),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 4),
            blurRadius: 30,
            color: kShadowColor,
          ),
        ],
      ),
      child: Column(
        children: [
          Text(
            "Tarih: " +
                tarih.day.toString() +
                "." +
                tarih.month.toString() +
                "." +
                tarih.year.toString(),
            // style: GoogleFonts.openSans(fontWeight: FontWeight.w600),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Counter(
                color: kInfectedColor,
                number: data.dailyInfected,
                title: "Vaka",
              ),
              Counter(
                color: kDeathColor,
                number: data.dailyDeceased,
                title: "Ölüm",
              ),
              Counter(
                color: kRecovercolor,
                number: data.dailyRecovered,
                title: "İyileşen",
              ),
              MaterialButton(
                onPressed: () {},
                color: Colors.white,
                textColor: Colors.white,
                child: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.red,
                ),
                padding: EdgeInsets.all(2),
                shape: CircleBorder(),
              )
            ],
          ),
        ],
      ),
    );
  }
}
