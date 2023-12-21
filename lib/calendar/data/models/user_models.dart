import 'dart:convert';

import 'package:flutter/material.dart';

import '../../../core/enums/calendar_enums.dart';

@immutable
class User {
  const User({
    required this.id,
    required this.name,
    required this.offered,
    required this.current,
    required this.dueDate,
    required this.level,
    required this.daysLeft,
    required this.phone,
    required this.priority,
    required this.type,
  });

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] as String,
      name: map['name'] as String,
      offered: map['offered'] as double,
      current: map['current'] as double,
      dueDate: DateTime.fromMillisecondsSinceEpoch(map['dueDate'] as int),
      level: map['level'] as int,
      daysLeft: map['daysLeft'] as int,
      phone: map['phone'] as String,
      priority: (map['priority'] as String).priority,
      type: (map['type'] as String).type,
    );
  }

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);

  final String id;
  final String name;
  final double offered;
  final double current;
  final DateTime dueDate;
  final int level;
  final int daysLeft;
  final String phone;
  final UserPriority priority;
  final CalendarTabs type;

  User copyWith({
    String? id,
    String? name,
    double? offered,
    double? current,
    DateTime? dueDate,
    int? level,
    int? daysLeft,
    String? phone,
    UserPriority? priority,
    CalendarTabs? type,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      offered: offered ?? this.offered,
      current: current ?? this.current,
      dueDate: dueDate ?? this.dueDate,
      level: level ?? this.level,
      daysLeft: daysLeft ?? this.daysLeft,
      phone: phone ?? this.phone,
      priority: priority ?? this.priority,
      type: type ?? this.type,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'offered': offered,
      'current': current,
      'dueDate': dueDate.millisecondsSinceEpoch,
      'level': level,
      'daysLeft': daysLeft,
      'phone': phone,
      'priority': priority.name,
    };
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() {
    return '''
      User(
      id: $id,
      name: $name,
      offered: $offered,
      current: $current,
      dueDate: $dueDate,
      level: $level,
      daysLeft: $daysLeft,
      phone: $phone,
      priority: $priority
      )
      ''';
  }

  @override
  bool operator ==(covariant User other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.offered == offered &&
        other.current == current &&
        other.dueDate == dueDate &&
        other.level == level &&
        other.daysLeft == daysLeft &&
        other.phone == phone &&
        other.priority == priority;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        offered.hashCode ^
        current.hashCode ^
        dueDate.hashCode ^
        level.hashCode ^
        daysLeft.hashCode ^
        phone.hashCode ^
        priority.hashCode;
  }
}
