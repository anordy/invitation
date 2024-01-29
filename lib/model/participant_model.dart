// class ParticipantModel {
//   final String id;
//   final String name;
//   final String date;
//   final String icon;

//   ParticipantModel(
//       {required this.date,
    
//       required this.id,
//       required this.name,
//       required this.icon});
// }

// List<ParticipantModel> participantModels = [
//   ParticipantModel(
//       id: "1",
//       name: 'Anord John',
//       icon: 'AJ',
//       date: '10:10 PM'),
    
//   ParticipantModel(
//       id: "2",
//       name: 'Gerald Njau',
//       icon: 'GN',
//       date: '10:15 PM'),
   
//   ParticipantModel(
//       id: "3",
//       name: 'Lucksford Isack',
//       icon: 'LI',
//       date: '10:25 PM',
//   ),

//   ParticipantModel(
//       id: "4",
//       name: 'Matungwa Kaana',
//       icon: 'MK',
//       date: '10:28 PM',
//   ),

//   ParticipantModel(
//       id: "3",
//       name: 'Caicedo Chelsea',
//       icon: 'CC',
//       date: '10:30 PM',
//   )
  
// ];

// To parse this JSON data, do
//
//     final participantModel = participantModelFromJson(jsonString);

import 'dart:convert';

ParticipantModel participantModelFromJson(String str) => ParticipantModel.fromJson(json.decode(str));

String participantModelToJson(ParticipantModel data) => json.encode(data.toJson());

class ParticipantModel {
    int code;
    String status;
    String message;
    List<Participant> data;

    ParticipantModel({
        required this.code,
        required this.status,
        required this.message,
        required this.data,
    });

    factory ParticipantModel.fromJson(Map<String, dynamic> json) => ParticipantModel(
        code: json["code"],
        status: json["status"],
        message: json["message"],
        data: List<Participant>.from(json["data"].map((x) => Participant.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "code": code,
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Participant {
    int id;
    String fullName;
    String gender;
    String phoneNumber;
    String physicalAddress;
    int scanStatus;

    Participant({
        required this.id,
        required this.fullName,
        required this.gender,
        required this.phoneNumber,
        required this.physicalAddress,
        required this.scanStatus,
    });

    factory Participant.fromJson(Map<String, dynamic> json) => Participant(
        id: json["id"],
        fullName: json["full_name"],
        gender: json["gender"],
        phoneNumber: json["phone_number"],
        physicalAddress: json["physical_address"],
        scanStatus: json["scan_status"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "full_name": fullName,
        "gender": gender,
        "phone_number": phoneNumber,
        "physical_address": physicalAddress,
        "scan_status": scanStatus,
    };
}
