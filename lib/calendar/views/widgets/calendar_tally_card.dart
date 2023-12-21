import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class CalendarTallyCard extends StatelessWidget {
  CalendarTallyCard({super.key});

  final date = DateTime(2023, 05, 31);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.only(
        left: 24.w,
        right: 24.w,
        top: 24.h,
        bottom: 48.h,
      ),
      itemCount: 8,
      separatorBuilder: (context, index) {
        return SizedBox(height: 24.h);
      },
      itemBuilder: (context, index) {
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
                  color: Colors.red,
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
                              '${date.day}',
                              textAlign: TextAlign.center,
                              style: textStyle.copyWith(
                                fontSize: 28.sp,
                                letterSpacing: -2,
                                height: 1.1,
                              ),
                            ),
                            Text(
                              DateFormat('MMM').format(date).toUpperCase(),
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
                    const _TallyNumber(name: 'HRD'),

                    //? Tech 1
                    const _TallyNumber(name: 'Tech 1'),

                    //? Follow up
                    const _TallyNumber(name: 'Follow up'),

                    //? Total
                    _TallyNumber(
                      name: 'Total',
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
  }
}

class _TallyNumber extends StatelessWidget {
  const _TallyNumber({
    required this.name,
    this.bgColor,
    this.textColor,
  });

  final String name;
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
              '33',
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
