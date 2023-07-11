import 'dart:convert';

//Curses cursesFromJson(String str) => Curses.fromJson(json.decode(str));
List<Curses> cursesFromJson(String str) => List<Curses>.from(json.decode(str).map((x) => Curses.fromJson(x)));

//String cursesToJson(Curses data) => json.encode(data.toJson());

class Curses {
    String token;
    String code;
    String name;
    int semester;
    int year;
    bool active;

    Curses({
        required this.token,
        required this.code,
        required this.name,
        required this.semester,
        required this.year,
        required this.active,
    });

    factory Curses.fromJson(Map<String, dynamic> json) => Curses(
        token: json["token"],
        code: json["code"],
        name: json["name"],
        semester: json["semester"],
        year: json["year"],
        active: json["active"],
    );

    Map<String, dynamic> toJson() => {
        "token": token,
        "code": code,
        "name": name,
        "semester": semester,
        "year": year,
        "active": active,
    };
}
