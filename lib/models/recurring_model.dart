import 'dart:convert';

class RecurringModel {
  final int? id;
  final String time;
  final String message;
  final String icon;
  final String backColorIcon;


  RecurringModel({
    required this.id,
    required this.time,
    required this.message,
    required this.icon,
    required this.backColorIcon,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'time': time,
      'message': message,
      'icon': icon,
      'backColorIcon': backColorIcon,
    };
  }

  factory RecurringModel.fromMap(Map<String, dynamic> map) {
    return RecurringModel(
      id: map['id']?.toInt() ?? 0,
      time: map['time'] ?? '',
      message: map['message'] ?? '',
      icon: map['icon'] ?? '',
      backColorIcon: map['backColorIcon'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory RecurringModel.fromJson(String source) => RecurringModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'RecurringModel(id: $id, time: $time, message: $message, icon: $icon, backColorIcon: $backColorIcon)';
  }
}
