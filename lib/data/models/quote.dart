// To parse this JSON data, do
//
//     final quote = quoteFromJson(jsonString);

import 'dart:convert';

List<Quote> quoteFromJson(String str) => List<Quote>.from(json.decode(str).map((x) => Quote.fromJson(x)));

String quoteToJson(List<Quote> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Quote {
    String q;
    String a;
    String c;
    String h;

    Quote({
        required this.q,
        required this.a,
        required this.c,
        required this.h,
    });

    Quote copyWith({
        String? q,
        String? a,
        String? c,
        String? h,
    }) => 
        Quote(
            q: q ?? this.q,
            a: a ?? this.a,
            c: c ?? this.c,
            h: h ?? this.h,
        );

    factory Quote.fromJson(Map<String, dynamic> json) => Quote(
        q: json["q"],
        a: json["a"],
        c: json["c"],
        h: json["h"],
    );

    Map<String, dynamic> toJson() => {
        "q": q,
        "a": a,
        "c": c,
        "h": h,
    };
}
