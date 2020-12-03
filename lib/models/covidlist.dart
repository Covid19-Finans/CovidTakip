// To parse this JSON data, do
//
//     final covidList = covidListFromJson(jsonString);

import 'dart:convert';

List<CovidList> covidListFromJson(String str) => List<CovidList>.from(json.decode(str).map((x) => CovidList.fromJson(x)));

String covidListToJson(List<CovidList> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CovidList {
  CovidList({
    this.infected,
    this.tested,
    this.deceased,
    this.recovered,
    this.sourceUrl,
    this.lastUpdatedAtApify,
    this.readMe,
    this.lastUpdatedAtSource,
    this.dailyTested,
    this.dailyInfected,
    this.dailyDeceased,
    this.dailyRecovered,
    this.critical,
    this.icu,
    this.lastUpdateresultpify,
  });

  int infected;
  int tested;
  int deceased;
  int recovered;
  String sourceUrl;
  DateTime lastUpdatedAtApify;
  String readMe;
  DateTime lastUpdatedAtSource;
  int dailyTested;
  int dailyInfected;
  int dailyDeceased;
  int dailyRecovered;
  int critical;
  int icu;
  DateTime lastUpdateresultpify;

  factory CovidList.fromJson(Map<String, dynamic> json) => CovidList(
    infected: json["infected"],
    tested: json["tested"] == null ? null : json["tested"],
    deceased: json["deceased"],
    recovered: json["recovered"] == null ? null : json["recovered"],
    sourceUrl: json["sourceUrl"],
    lastUpdatedAtApify: json["lastUpdatedAtApify"] == null ? null : DateTime.parse(json["lastUpdatedAtApify"]),
    readMe: json["readMe"],
    lastUpdatedAtSource: json["lastUpdatedAtSource"] == null ? null : DateTime.parse(json["lastUpdatedAtSource"]),
    dailyTested: json["dailyTested"] == null ? null : json["dailyTested"],
    dailyInfected: json["dailyInfected"] == null ? null : json["dailyInfected"],
    dailyDeceased: json["dailyDeceased"] == null ? null : json["dailyDeceased"],
    dailyRecovered: json["dailyRecovered"] == null ? null : json["dailyRecovered"],
    critical: json["critical"] == null ? null : json["critical"],
    icu: json["ICU"] == null ? null : json["ICU"],
    lastUpdateresultpify: json["lastUpdateresultpify"] == null ? null : DateTime.parse(json["lastUpdateresultpify"]),
  );

  Map<String, dynamic> toJson() => {
    "infected": infected,
    "tested": tested == null ? null : tested,
    "deceased": deceased,
    "recovered": recovered == null ? null : recovered,
    "sourceUrl": sourceUrl,
    "lastUpdatedAtApify": lastUpdatedAtApify == null ? null : lastUpdatedAtApify.toIso8601String(),
    "readMe": readMe,
    "lastUpdatedAtSource": lastUpdatedAtSource == null ? null : lastUpdatedAtSource.toIso8601String(),
    "dailyTested": dailyTested == null ? null : dailyTested,
    "dailyInfected": dailyInfected == null ? null : dailyInfected,
    "dailyDeceased": dailyDeceased == null ? null : dailyDeceased,
    "dailyRecovered": dailyRecovered == null ? null : dailyRecovered,
    "critical": critical == null ? null : critical,
    "ICU": icu == null ? null : icu,
    "lastUpdateresultpify": lastUpdateresultpify == null ? null : lastUpdateresultpify.toIso8601String(),
  };
}
