import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/enums/calendar_enums.dart';
import '../../data/controller/calendar_controller.dart';
import 'calendar_personal_detail_card.dart';
import 'calendar_tally_card.dart';

class CalendarTabsView extends StatelessWidget {
  const CalendarTabsView({super.key});

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      children: [
        for (final tab in CalendarTabs.values)
          Obx(
            () {
              return kCalendarController.isFetching.value
                  ? const Center(child: CircularProgressIndicator())
                  : kCalendarController.calendarViews.value ==
                          CalendarViews.days
                      ? CalendarPersonalDetailCard(tab: tab)
                      : CalendarTallyCard(tab: tab);
            },
          ),
      ],
    );
  }
}
