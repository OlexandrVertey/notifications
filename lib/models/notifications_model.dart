import 'dart:convert';

class OneTimeNotificationsModel {
  final int? id;
  final String time;
  final String message;
  final String icon;
  final String backColorIcon;


  OneTimeNotificationsModel({
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

  factory OneTimeNotificationsModel.fromMap(Map<String, dynamic> map) {
    return OneTimeNotificationsModel(
      id: map['id']?.toInt() ?? 0,
      time: map['time'] ?? '',
      message: map['message'] ?? '',
      icon: map['icon'] ?? '',
      backColorIcon: map['backColorIcon'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory OneTimeNotificationsModel.fromJson(String source) => OneTimeNotificationsModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'NotificationsModel(id: $id, time: $time, message: $message, icon: $icon, backColorIcon: $backColorIcon)';
  }
}
