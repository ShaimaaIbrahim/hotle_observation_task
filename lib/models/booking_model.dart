import 'dart:convert';

class Booking {
  int? book_id;
  String? branch_name;
  double? cost;
  int? residents_count;

  Booking(
      {this.book_id,
      this.branch_name,
      this.cost,
      required this.residents_count});

  factory Booking.fromRawJson(String str) => Booking.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Booking.fromJson(Map<String, dynamic> json) => Booking(
      book_id: json['book_id'],
      branch_name: json['branch_name'],
      cost: json['cost'],
      residents_count: json['residents_count']);

  Map<String, dynamic> toJson() => {
        'book_id': book_id,
        'branch_name': branch_name,
        'cost': cost,
        'residents_count': residents_count
      };
}
