class Soru {
  String soru;

  Soru.fromJson(Map<String, dynamic> json) {
    soru = json['soru'];
  }
}
