// To parse this JSON data, do
//
//     final album = albumFromJson(jsonString);

// ignore_for_file: prefer_null_aware_operators

import 'dart:convert';

Album albumFromJson(String str) => Album.fromJson(json.decode(str));

String albumToJson(Album data) => json.encode(data.toJson());

class Album {
  Album({
    this.time,
    this.disclaimer,
    this.chartName,
    this.bpi,
  });

  Time? time;
  String? disclaimer;
  String? chartName;
  Bpi? bpi;

  factory Album.fromJson(Map<String, dynamic> json) => Album(
        time: json["time"] == null ? null : Time.fromJson(json["time"]),
        disclaimer: json["disclaimer"],
        chartName: json["chartName"],
        bpi: json["bpi"] == null ? null : Bpi.fromJson(json["bpi"]),
      );

  Map<String, dynamic> toJson() => {
        "time": time == null ? null : time?.toJson(),
        "disclaimer": disclaimer,
        "chartName": chartName,
        "bpi": bpi == null ? null : bpi?.toJson(),
      };
}

class Bpi {
  Bpi({
    this.usd,
    this.gbp,
    this.eur,
  });

  Eur? usd;
  Eur? gbp;
  Eur? eur;

  factory Bpi.fromJson(Map<String, dynamic> json) => Bpi(
        usd: json["USD"] == null ? null : Eur.fromJson(json["USD"]),
        gbp: json["GBP"] == null ? null : Eur.fromJson(json["GBP"]),
        eur: json["EUR"] == null ? null : Eur.fromJson(json["EUR"]),
      );

  Map<String, dynamic> toJson() => {
        "USD": usd == null ? null : usd?.toJson(),
        "GBP": gbp == null ? null : gbp?.toJson(),
        "EUR": eur == null ? null : eur?.toJson(),
      };
}

class Eur {
  Eur({
    this.code,
    this.symbol,
    this.rate,
    this.description,
    this.rateFloat,
  });

  String? code;
  String? symbol;
  String? rate;
  String? description;
  double? rateFloat;

  factory Eur.fromJson(Map<String, dynamic> json) => Eur(
        code: json["code"],
        symbol: json["symbol"],
        rate: json["rate"],
        description: json["description"],
        rateFloat:
            json["rate_float"] == null ? null : json["rate_float"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "symbol": symbol,
        "rate": rate,
        "description": description,
        "rate_float": rateFloat,
      };
}

class Time {
  Time({
    this.updated,
    this.updatedIso,
    this.updateduk,
  });

  String? updated;
  DateTime? updatedIso;
  String? updateduk;

  factory Time.fromJson(Map<String, dynamic> json) => Time(
        updated: json["updated"],
        updatedIso: json["updatedISO"] == null
            ? null
            : DateTime.parse(json["updatedISO"]),
        updateduk: json["updateduk"],
      );

  Map<String, dynamic> toJson() => {
        "updated": updated,
        "updatedISO": updatedIso == null ? null : updatedIso?.toIso8601String(),
        "updateduk": updateduk,
      };
}
