// To parse this JSON data, do
//
//     final checkCardModel = checkCardModelFromJson(jsonString);

import 'dart:convert';

CheckCardModel checkCardModelFromJson(String str) => CheckCardModel.fromJson(json.decode(str));

String checkCardModelToJson(CheckCardModel data) => json.encode(data.toJson());

class CheckCardModel {
    int code;
    String status;
    String message;
    Data data;

    CheckCardModel({
        required this.code,
        required this.status,
        required this.message,
        required this.data,
    });

    factory CheckCardModel.fromJson(Map<String, dynamic> json) => CheckCardModel(
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
    String eventId;
    String fullName;
    String gender;
    String phoneNumber;
    String physicalAddress;
    dynamic deletedAt;
    DateTime createdAt;
    DateTime updatedAt;

    Data({
        required this.id,
        required this.eventId,
        required this.fullName,
        required this.gender,
        required this.phoneNumber,
        required this.physicalAddress,
        required this.deletedAt,
        required this.createdAt,
        required this.updatedAt,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        eventId: json["event_id"],
        fullName: json["full_name"],
        gender: json["gender"],
        phoneNumber: json["phone_number"],
        physicalAddress: json["physical_address"],
        deletedAt: json["deleted_at"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "event_id": eventId,
        "full_name": fullName,
        "gender": gender,
        "phone_number": phoneNumber,
        "physical_address": physicalAddress,
        "deleted_at": deletedAt,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}
