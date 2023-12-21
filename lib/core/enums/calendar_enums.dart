import 'package:flutter/material.dart';

enum CalendarViews {
  days(name: 'Day'),
  week(name: 'Week'),
  ;

  const CalendarViews({required this.name});

  final String name;
}

enum CalendarTabs {
  all(name: 'All'),
  hrd(name: 'HRD'),
  tech1(name: 'Tech 1'),
  followUp(name: 'Follow up'),
  ;

  const CalendarTabs({required this.name});

  final String name;
}

enum UserPriority {
  high(text: 'High Priority', color: Colors.red),
  medium(text: 'Medium Priority', color: Colors.orange),
  low(text: 'Low Priority', color: Colors.green),
  ;

  const UserPriority({
    required this.text,
    required this.color,
  });

  final String text;
  final Color color;
}

extension CalendarTabsExtension on String {
  CalendarTabs get type {
    if (this == CalendarTabs.all.name) return CalendarTabs.all;
    if (this == CalendarTabs.hrd.name) return CalendarTabs.hrd;
    if (this == CalendarTabs.followUp.name) return CalendarTabs.followUp;
    return CalendarTabs.tech1;
  }
}

extension CalendarUserExtension on String {
  UserPriority get priority {
    if (this == UserPriority.high.text) return UserPriority.high;
    if (this == UserPriority.medium.text) return UserPriority.low;
    return UserPriority.low;
  }
}

extension CalendarUserDataExtension on int {
  UserPriority get priority {
    if (this == 0) return UserPriority.high;
    if (this == 1) return UserPriority.medium;
    return UserPriority.low;
  }

  CalendarTabs get type {
    if (this == 1) return CalendarTabs.hrd;
    if (this == 2) return CalendarTabs.tech1;
    if (this == 3) return CalendarTabs.followUp;
    return CalendarTabs.all;
  }
}
