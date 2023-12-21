import 'package:flutter/material.dart';

import '../../../core/enums/calendar_enums.dart';
import 'calendar_personal_detail_card.dart';

class CalendarTabsView extends StatelessWidget {
  const CalendarTabsView({super.key});

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      children: [
        for (final tab in CalendarTabs.values)
          CalendarPersonalDetailCard(
            tab: tab,
          ),
      ],
    );
  }
}
