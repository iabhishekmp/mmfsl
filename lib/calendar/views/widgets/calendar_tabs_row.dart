import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/enums/calendar_enums.dart';

class CalendarTabsRow extends StatelessWidget {
  const CalendarTabsRow({super.key});

  @override
  Widget build(BuildContext context) {
    return TabBar(
      tabs: [
        for (final tab in CalendarTabs.values) Text('${tab.name} (**)'),
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
  }
}
