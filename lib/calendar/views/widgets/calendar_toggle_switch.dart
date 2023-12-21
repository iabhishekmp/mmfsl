import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/enums/calendar_enums.dart';

class CalendarToggleSwitch extends StatefulWidget {
  const CalendarToggleSwitch({
    required this.onToggle,
    super.key,
  });

  final void Function(CalendarViews) onToggle;

  @override
  State<CalendarToggleSwitch> createState() => _CalendarToggleSwitchState();
}

class _CalendarToggleSwitchState extends State<CalendarToggleSwitch> {
  CalendarViews view = CalendarViews.days;
  @override
  Widget build(BuildContext context) {
    final radius = BorderRadius.circular(6);
    const borderWidth = 1.5;
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: radius,
      ),
      child: Padding(
        padding: const EdgeInsets.all(borderWidth),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: radius,
            color: Colors.white,
          ),
          child: CupertinoSlidingSegmentedControl<CalendarViews>(
            thumbColor: Theme.of(context).primaryColor,
            backgroundColor: Theme.of(context).primaryColor.withOpacity(0.05),
            groupValue: view,
            padding: EdgeInsets.zero,
            onValueChanged: (value) {
              if (value != null) {
                setState(() => view = value);
                widget.onToggle(view);
              }
            },
            children: {
              for (final v in CalendarViews.values)
                v: Text(
                  v.name,
                  style: TextStyle(
                    fontSize: 16,
                    color: view == v
                        ? Colors.white
                        : Theme.of(context).primaryColor,
                    height: 2.3,
                  ),
                ),
            },
          ),
        ),
      ),
    );
  }
}
