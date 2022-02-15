import 'dart:convert';

class RoomModel {
  int? id;
  int? room_num;
  String? branch_name;
  String? type;
  int? status;
  String? image;

  RoomModel({this.id, this.room_num, this.branch_name, this.type, this.status, this.image});

  factory RoomModel.fromRawJson(String str) =>
      RoomModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory RoomModel.fromJson(Map<String, dynamic> json) => RoomModel(
      id: json['id'],
      room_num: json['room_num'],
      branch_name: json['branch_name'],
      type: json['type'],
      image: json['image'],
      status: json['status']);

  Map<String, dynamic> toJson() => {
        'id': id,
        'room_num': room_num,
        'branch_name': branch_name,
        'type': type,
        'status': status,
        'image': image
      };
}
