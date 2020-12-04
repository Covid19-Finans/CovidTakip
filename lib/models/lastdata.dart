// To parse this JSON data, do
//
//     final covidLastest = covidLastestFromJson(jsonString);

import 'dart:convert';

CovidLastest covidLastestFromJson(String str) =>
    CovidLastest.fromJson(json.decode(str));

String covidLastestToJson(CovidLastest data) => json.encode(data.toJson());

class CovidLastest {
  CovidLastest({
    this.infected,
    this.deceased,
    this.recovered,
    this.tested,
    this.critical,
    this.icu,
    this.dailyTested,
    this.dailyInfected,
    this.dailyDeceased,
    this.dailyRecovered,
    this.sourceUrl,
    this.lastUpdatedAtApify,
    this.lastUpdatedAtSource,
    this.readMe,
  });

  int infected;
  int deceased;
  int recovered;
  int tested;
  int critical;
  int icu;
  int dailyTested;
  int dailyInfected;
  int dailyDeceased;
  int dailyRecovered;
  String sourceUrl;
  String lastUpdatedAtApify;
  String lastUpdatedAtSource;
  String readMe;

  factory CovidLastest.fromJson(Map<String, dynamic> json) => CovidLastest(
        infected: json["infected"],
        deceased: json["deceased"],
        recovered: json["recovered"],
        tested: json["tested"],
        critical: json["critical"],
        icu: json["ICU"],
        dailyTested: json["dailyTested"],
        dailyInfected: json["dailyInfected"],
        dailyDeceased: json["dailyDeceased"],
        dailyRecovered: json["dailyRecovered"],
        sourceUrl: json["sourceUrl"],
        lastUpdatedAtApify: json["lastUpdatedAtApify"],
        lastUpdatedAtSource: json["lastUpdatedAtSource"],
        readMe: json["readMe"],
      );

  Map<String, dynamic> toJson() => {
        "infected": infected,
        "deceased": deceased,
        "recovered": recovered,
        "tested": tested,
        "critical": critical,
        "ICU": icu,
        "dailyTested": dailyTested,
        "dailyInfected": dailyInfected,
        "dailyDeceased": dailyDeceased,
        "dailyRecovered": dailyRecovered,
        "sourceUrl": sourceUrl,
        "lastUpdatedAtApify": lastUpdatedAtApify,
        "lastUpdatedAtSource": lastUpdatedAtSource,
        "readMe": readMe,
      };
}
