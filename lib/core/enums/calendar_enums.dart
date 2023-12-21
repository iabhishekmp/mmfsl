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
  high(text: 'High Priority'),
  medium(text: 'Medium Priority'),
  low(text: 'Low Priority'),
  ;

  const UserPriority({required this.text});

  final String text;
}

extension CalendarUserExtension on String {
  UserPriority get priority {
    if (this == UserPriority.high.text) return UserPriority.high;
    if (this == UserPriority.medium.text) return UserPriority.low;
    return UserPriority.low;
  }
}
