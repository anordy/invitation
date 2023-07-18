
import 'dart:convert';

EventDetail eventDetailFromJson(String str) => EventDetail.fromJson(json.decode(str));

String eventDetailToJson(EventDetail data) => json.encode(data.toJson());

class EventDetail {
    int code;
    String status;
    String message;
    Data data;

    EventDetail({
        required this.code,
        required this.status,
        required this.message,
        required this.data,
    });

    factory EventDetail.fromJson(Map<String, dynamic> json) => EventDetail(
        code: json["code"],
        status: json["status"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "code": code,
        "status": status,
        "message": message,
        "data": data.toJson(),
    };
}

class Data {
    int id;
    String title;
    String code;
    String eventcategoryId;
    String venue;
    DateTime startDate;
    DateTime endDate;
    int capasity;
    String status;
    DateTime createdAt;
    DateTime updatedAt;
    dynamic deletedAt;
    String userId;
    List<dynamic> scanners;

    Data({
        required this.id,
        required this.title,
        required this.code,
        required this.eventcategoryId,
        required this.venue,
        required this.startDate,
        required this.endDate,
        required this.capasity,
        required this.status,
        required this.createdAt,
        required this.updatedAt,
        this.deletedAt,
        required this.userId,
        required this.scanners,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        title: json["title"],
        code: json["code"],
        eventcategoryId: json["eventcategory_id"],
        venue: json["venue"],
        startDate: DateTime.parse(json["start_date"]),
        endDate: DateTime.parse(json["end_date"]),
        capasity: json["capasity"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
        userId: json["user_id"],
        scanners: List<dynamic>.from(json["scanners"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "code": code,
        "eventcategory_id": eventcategoryId,
        "venue": venue,
        "start_date": "${startDate.year.toString().padLeft(4, '0')}-${startDate.month.toString().padLeft(2, '0')}-${startDate.day.toString().padLeft(2, '0')}",
        "end_date": "${endDate.year.toString().padLeft(4, '0')}-${endDate.month.toString().padLeft(2, '0')}-${endDate.day.toString().padLeft(2, '0')}",
        "capasity": capasity,
        "status": status,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "deleted_at": deletedAt,
        "user_id": userId,
        "scanners": List<dynamic>.from(scanners.map((x) => x)),
    };
}
