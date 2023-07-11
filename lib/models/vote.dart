import 'dart:convert';

Vote voteFromJson(String str) => Vote.fromJson(json.decode(str));

String voteToJson(Vote data) => json.encode(data.toJson());

class Vote {
    String sectionToken;
    DateTime attendance;
    int choice;

    Vote({
        required this.sectionToken,
        required this.attendance,
        required this.choice,
    });

    factory Vote.fromJson(Map<String, dynamic> json) => Vote(
        sectionToken: json["sectionToken"],
        attendance: DateTime.parse(json["attendance"]),
        choice: json["choice"],
    );

    Map<String, dynamic> toJson() => {
        "sectionToken": sectionToken,
        "attendance": "${attendance.year.toString().padLeft(4, '0')}-${attendance.month.toString().padLeft(2, '0')}-${attendance.day.toString().padLeft(2, '0')}",
        "choice": choice,
    };
}
