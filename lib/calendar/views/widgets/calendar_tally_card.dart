import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../core/enums/calendar_enums.dart';
import '../../data/controller/calendar_controller.dart';

class CalendarTallyCard extends StatelessWidget {
  CalendarTallyCard({required this.tab, super.key});

  final date = DateTime(2023, 05, 31);
  final CalendarTabs tab;

  @override
  Widget build(BuildContext context) {
    final boldTextStyle = TextStyle(
      fontSize: 18.sp,
      fontWeight: FontWeight.bold,
      color: Colors.grey[700],
    );

    return Obx(
      () {
        final users = kCalendarController.usersTally.value;
        return users.isEmpty
            ? Center(
                child: Text(
                  'No data found!',
                  style: boldTextStyle,
                ),
              )
            : ListView.separated(
                padding: EdgeInsets.only(
                  left: 24.w,
                  right: 24.w,
                  top: 24.h,
                  bottom: 48.h,
                ),
                itemCount: users.length,
                separatorBuilder: (context, index) {
                  return SizedBox(height: 24.h);
                },
                itemBuilder: (context, index) {
                  final user = users[index];
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 8,
                          color: Colors.grey.withOpacity(0.5),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        //? Red Indicator
                        Container(
                          margin: EdgeInsets.symmetric(
                            vertical: 14.h,
                          ),
                          decoration: BoxDecoration(
                            color: user.priority.color,
                            borderRadius: BorderRadius.circular(5.r),
                          ),
                          height: 70.h,
                          width: 5.w,
                        ),

                        //? Rest of the tally info
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              //? Date
                              Builder(
                                builder: (context) {
                                  final textStyle = TextStyle(
                                    color: Colors.grey[600],
                                    fontWeight: FontWeight.bold,
                                  );
                                  return Column(
                                    children: [
                                      Text(
                                        '${user.date.day}',
                                        textAlign: TextAlign.center,
                                        style: textStyle.copyWith(
                                          fontSize: 28.sp,
                                          letterSpacing: -2,
                                          height: 1.1,
                                        ),
                                      ),
                                      Text(
                                        DateFormat('MMM')
                                            .format(user.date)
                                            .toUpperCase(),
                                        textAlign: TextAlign.center,
                                        style: textStyle.copyWith(
                                          fontSize: 17.sp,
                                          letterSpacing: -1,
                                          height: 1.1,
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              ),

                              //? HRD
                              _TallyNumber(
                                name: 'HRD',
                                count: user.hrd,
                              ),

                              //? Tech 1
                              _TallyNumber(
                                name: 'Tech 1',
                                count: user.tech1,
                              ),

                              //? Follow up
                              _TallyNumber(
                                name: 'Follow up',
                                count: user.followUp,
                              ),

                              //? Total
                              _TallyNumber(
                                name: 'Total',
                                count: user.total,
                                bgColor: Colors.grey[800],
                                textColor: Colors.white.withOpacity(0.8),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
      },
    );
  }
}

class _TallyNumber extends StatelessWidget {
  const _TallyNumber({
    required this.name,
    required this.count,
    this.bgColor,
    this.textColor,
  });

  final String name;
  final int count;
  final Color? bgColor;
  final Color? textColor;
  @override
  Widget build(BuildContext context) {
    const radius = 26.0;
    const width = 1.5;
    final textStyle = TextStyle(
      fontSize: 16.sp,
      color: Colors.grey[700],
      fontWeight: FontWeight.w600,
    );
    return Column(
      children: [
        CircleAvatar(
          backgroundColor:
              bgColor == null ? Colors.grey.shade400 : Colors.white,
          radius: radius,
          child: CircleAvatar(
            backgroundColor: bgColor ?? Colors.white,
            radius: radius - width,
            child: Text(
              '$count',
              style: textStyle.copyWith(color: textColor),
            ),
          ),
        ),
        SizedBox(height: 5.h),
        Text(
          name,
          style: textStyle,
        ),
      ],
    );
  }
}
