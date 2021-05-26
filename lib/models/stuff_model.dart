import 'dart:convert';

class StuffModel {
  int id;
  String description;
  String contactName;
  String photoPath;
  String date;
  String phone;

  StuffModel({
    this.id,
    this.description,
    this.contactName,
    this.photoPath,
    this.date,
    this.phone,
  });

  bool get hasPhoto => photoPath != null && photoPath.isNotEmpty;

  Map<String, dynamic> toMap() {
    Map<String, dynamic> data = {
      'description': description,
      'contactName': contactName,
      'photoPath': photoPath,
      'date': date,
      'phone': phone,
    };

    if (id != null) data['id'] = id;
    return data;
  }

  factory StuffModel.fromMap(Map<String, dynamic> map) {
    return StuffModel(
      id: map['id'],
      description: map['description'],
      contactName: map['contactName'],
      photoPath: map['photoPath'],
      date: map['date'],
      phone: map['phone'],
    );
  }

  String toJson() => json.encode(toMap());

  factory StuffModel.fromJson(String source) =>
      StuffModel.fromMap(json.decode(source));
}
