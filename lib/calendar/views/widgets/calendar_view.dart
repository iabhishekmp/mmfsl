import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../core/utils.dart';

class CalendarView extends StatefulWidget {
  const CalendarView({super.key});

  @override
  State<CalendarView> createState() => _CalendarViewState();
}

class _CalendarViewState extends State<CalendarView> {
  final CalendarFormat _calendarFormat = CalendarFormat.week;
  RangeSelectionMode _rangeSelectionMode = RangeSelectionMode.disabled;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  DateTime? _rangeStart;
  DateTime? _rangeEnd;

  final _textStyle = const TextStyle(fontSize: 17);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 140.h,
      child: TableCalendar<double>(
        firstDay: kFirstDay,
        lastDay: kLastDay,
        focusedDay: _focusedDay,
        selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
        rangeStartDay: _rangeStart,
        rangeEndDay: _rangeEnd,
        calendarFormat: _calendarFormat,
        rangeSelectionMode: _rangeSelectionMode,
        startingDayOfWeek: StartingDayOfWeek.monday,
        weekendDays: const [
          DateTime.sunday,
        ],
        calendarStyle: CalendarStyle(
          defaultTextStyle: _textStyle,
          tablePadding: const EdgeInsets.symmetric(
            vertical: 12,
            horizontal: 24,
          ),
          todayTextStyle: _textStyle,
          selectedDecoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Theme.of(context).primaryColor,
          ),
          rangeHighlightColor: Theme.of(context).primaryColor.withOpacity(0.3),
          todayDecoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              width: 2.5,
              color: Theme.of(context).primaryColor,
            ),
          ),
          rangeStartTextStyle: _textStyle.copyWith(
            color: Colors.white,
          ),
          rangeStartDecoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Theme.of(context).primaryColor,
          ),
          rangeEndTextStyle: _textStyle.copyWith(
            color: Colors.white,
          ),
          withinRangeTextStyle: _textStyle,
          weekendTextStyle: _textStyle.copyWith(
            color: Colors.red,
          ),
          rangeEndDecoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Theme.of(context).primaryColor,
          ),
        ),
        headerStyle: HeaderStyle(
          headerPadding: const EdgeInsets.all(12),
          formatButtonVisible: false,
          leftChevronVisible: false,
          rightChevronVisible: false,
          titleTextFormatter: (date, locale) {
            return DateFormat('MMMM yy').format(date);
          },
        ),
        daysOfWeekStyle: DaysOfWeekStyle(
          weekendStyle: const TextStyle(
            color: Colors.red,
          ),
          dowTextFormatter: (date, locale) {
            return DateFormat('ccccc').format(date);
          },
        ),
        onDaySelected: (selectedDay, focusedDay) {
          if (!isSameDay(_selectedDay, selectedDay)) {
            setState(() {
              _selectedDay = selectedDay;
              _focusedDay = focusedDay;
              _rangeStart = null; // Important to clean those
              _rangeEnd = null;
              _rangeSelectionMode = RangeSelectionMode.toggledOff;
            });
          }
        },
        onRangeSelected: (start, end, focusedDay) {
          setState(() {
            _selectedDay = null;
            _focusedDay = focusedDay;
            _rangeStart = start;
            _rangeEnd = end;
            _rangeSelectionMode = RangeSelectionMode.toggledOn;
          });
        },
        onPageChanged: (focusedDay) {
          _focusedDay = focusedDay;
        },
      ),
    );
  }
}
