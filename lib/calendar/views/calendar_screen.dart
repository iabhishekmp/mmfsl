import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/enums/calendar_enums.dart';
import '../data/controller/calendar_controller.dart';
import 'widgets/calendar_tabs_row.dart';
import 'widgets/calendar_tabs_view.dart';
import 'widgets/calendar_toggle_switch.dart';
import 'widgets/calendar_view.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        centerTitle: false,
        title: const Text('My Calendar'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: CalendarToggleSwitch(
              onToggle: (view) {
                kCalendarController.calendarViews.value = view;
              },
            ),
          ),
        ],
      ),
      body: DefaultTabController(
        length: CalendarTabs.values.length,
        child: Column(
          children: [
            //? Calendar
            CalendarView(
              onDaySelect: (day) {
                kCalendarController.fetchDataByDay(day: day);
              },
              onRangeSelect: (start, end) {
                kCalendarController.fetchDataByDay(
                  day: start,
                  end: end,
                );
              },
            ),

            //? Tally of calendar
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(18),
                    topRight: Radius.circular(18),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 25,
                    ),
                  ],
                ),
                child: Center(
                  child: Column(
                    children: [
                      SizedBox(height: 12.h),

                      //? Indicator
                      Container(
                        height: 5.h,
                        width: 100.w,
                        color: Colors.grey.shade300,
                      ),
                      SizedBox(height: 25.h),

                      //? Tabs
                      const CalendarTabsRow(),

                      //? Tabs View
                      const Expanded(child: CalendarTabsView()),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
