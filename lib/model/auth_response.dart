// To parse this JSON data, do
//
//     final authResponse = authResponseFromJson(jsonString);

import 'dart:convert';

AuthResponse authResponseFromJson(String str) => AuthResponse.fromJson(json.decode(str));

String authResponseToJson(AuthResponse data) => json.encode(data.toJson());

class AuthResponse {
    int code;
    String status;
    String message;
    Data data;

    AuthResponse({
        required this.code,
        required this.status,
        required this.message,
        required this.data,
    });

    factory AuthResponse.fromJson(Map<String, dynamic> json) => AuthResponse(
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
    String token;
    User user;
    List<dynamic> events;
    List<dynamic> linkedEvents;

    Data({
        required this.token,
        required this.user,
        required this.events,
        required this.linkedEvents,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        token: json["token"],
        user: User.fromJson(json["user"]),
        events: List<dynamic>.from(json["events"].map((x) => x)),
        linkedEvents: List<dynamic>.from(json["linked_events"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "token": token,
        "user": user.toJson(),
        "events": List<dynamic>.from(events.map((x) => x)),
        "linked_events": List<dynamic>.from(linkedEvents.map((x) => x)),
    };
}

class User {
    int id;
    String name;
    String phoneNumber;
    dynamic email;
    dynamic username;
    dynamic emailVerifiedAt;
    dynamic apiToken;
    DateTime createdAt;
    DateTime updatedAt;

    User({
        required this.id,
        required this.name,
        required this.phoneNumber,
        this.email,
        this.username,
        this.emailVerifiedAt,
        this.apiToken,
        required this.createdAt,
        required this.updatedAt,
    });

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        phoneNumber: json["phone_number"],
        email: json["email"],
        username: json["username"],
        emailVerifiedAt: json["email_verified_at"],
        apiToken: json["api_token"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "phone_number": phoneNumber,
        "email": email,
        "username": username,
        "email_verified_at": emailVerifiedAt,
        "api_token": apiToken,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}
