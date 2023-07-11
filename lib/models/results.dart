import 'dart:convert';

Results resultsFromJson(String str) => Results.fromJson(json.decode(str));

String resultsToJson(Results data) => json.encode(data.toJson());

class Results {
    String token;
    String code;
    String name;
    int semester;
    int year;
    bool active;
    double avg;
    int total;

    Results({
        required this.token,
        required this.code,
        required this.name,
        required this.semester,
        required this.year,
        required this.active,
        required this.avg,
        required this.total,
    });

    factory Results.fromJson(Map<String, dynamic> json) => Results(
        token: json["token"],
        code: json["code"],
        name: json["name"],
        semester: json["semester"],
        year: json["year"],
        active: json["active"],
        avg: json["avg"]?.toDouble(),
        total: json["total"],
    );

    Map<String, dynamic> toJson() => {
        "token": token,
        "code": code,
        "name": name,
        "semester": semester,
        "year": year,
        "active": active,
        "avg": avg,
        "total": total,
    };
}
