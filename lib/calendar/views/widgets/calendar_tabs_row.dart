import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../core/enums/calendar_enums.dart';
import '../../../core/extensions/users_extensions.dart';
import '../../data/controller/calendar_controller.dart';

class CalendarTabsRow extends StatelessWidget {
  const CalendarTabsRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        final users = kCalendarController.users.value;
        final usersTally = kCalendarController.usersTally.value;

        return TabBar(
          tabs: [
            for (final tab in CalendarTabs.values)
              Builder(
                builder: (context) {
                  final name = tab.name;
                  var count = 0;
                  if (kCalendarController.calendarViews.value ==
                      CalendarViews.days) {
                    count = users.totalByTab(tab);
                  } else {
                    count = usersTally.byTab(tab);
                  }
                  return Text('$name ($count)');
                },
              ),
          ],
          dividerHeight: 0,
          indicatorSize: TabBarIndicatorSize.tab,
          labelPadding: kTabLabelPadding.copyWith(bottom: 12.w),
          indicatorColor: Theme.of(context).primaryColor,
          indicatorWeight: 3.sp,
          labelColor: Colors.black,
          labelStyle: TextStyle(
            fontSize: 15.sp,
            fontWeight: FontWeight.w500,
          ),
        );
      },
    );
  }
}
