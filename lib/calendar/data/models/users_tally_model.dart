import 'dart:convert';

import 'package:flutter/cupertino.dart';

import '../../../core/enums/calendar_enums.dart';

@immutable
class UsersTallyModel {
  const UsersTallyModel({
    required this.date,
    required this.priority,
    required this.type,
    required this.hrd,
    required this.tech1,
    required this.followUp,
  }) : total = hrd + tech1 + followUp;

  factory UsersTallyModel.fromMap(Map<String, dynamic> map) {
    return UsersTallyModel(
      date: DateTime.fromMillisecondsSinceEpoch(map['date'] as int),
      priority: (map['priority'] as String).priority,
      type: (map['type'] as String).type,
      hrd: map['hrd'] as int,
      tech1: map['tech1'] as int,
      followUp: map['followUp'] as int,
    );
  }

  factory UsersTallyModel.fromJson(String source) =>
      UsersTallyModel.fromMap(json.decode(source) as Map<String, dynamic>);

  final DateTime date;
  final UserPriority priority;
  final CalendarTabs type;
  final int hrd;
  final int tech1;
  final int followUp;
  final int total;

  UsersTallyModel copyWith({
    DateTime? date,
    UserPriority? priority,
    CalendarTabs? type,
    int? hrd,
    int? tech1,
    int? followUp,
  }) {
    return UsersTallyModel(
      date: date ?? this.date,
      priority: priority ?? this.priority,
      type: type ?? this.type,
      hrd: hrd ?? this.hrd,
      tech1: tech1 ?? this.tech1,
      followUp: followUp ?? this.followUp,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'date': date.millisecondsSinceEpoch,
      'priority': priority.text,
      'type': type.name,
      'hrd': hrd,
      'tech1': tech1,
      'followUp': followUp,
    };
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() {
    return 'UsersTallyModel(date: $date, priority: $priority, type: $type, hrd: $hrd, tech1: $tech1, followUp: $followUp)';
  }

  @override
  bool operator ==(covariant UsersTallyModel other) {
    if (identical(this, other)) return true;

    return other.date == date &&
        other.priority == priority &&
        other.type == type &&
        other.hrd == hrd &&
        other.tech1 == tech1 &&
        other.followUp == followUp;
  }

  @override
  int get hashCode {
    return date.hashCode ^
        priority.hashCode ^
        type.hashCode ^
        hrd.hashCode ^
        tech1.hashCode ^
        followUp.hashCode;
  }
}
