import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../../../core/enums/calendar_enums.dart';
import '../../../core/extensions/users_extensions.dart';
import '../../../core/utils/my_launcher.dart';
import '../../../core/utils/my_parser.dart';
import '../../data/controller/calendar_controller.dart';

class CalendarPersonalDetailCard extends StatelessWidget {
  const CalendarPersonalDetailCard({required this.tab, super.key});

  final CalendarTabs tab;

  @override
  Widget build(BuildContext context) {
    final boldTextStyle = TextStyle(
      fontSize: 18.sp,
      fontWeight: FontWeight.bold,
      color: Colors.grey[700],
    );

    final normalTextStyle = TextStyle(
      fontSize: 16.sp,
      fontWeight: FontWeight.w500,
      color: Colors.grey[700],
    );
    return Obx(
      () {
        final count = kCalendarController.users.value.byTab(tab).length;
        return kCalendarController.isFetching.value
            ? const Center(child: CircularProgressIndicator())
            : count == 0
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
                    itemCount: count,
                    separatorBuilder: (context, index) {
                      return SizedBox(height: 24.h);
                    },
                    itemBuilder: (context, index) {
                      final users = kCalendarController.users.value.byTab(tab);
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
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            children: [
                              //? name, priority & call
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  //? name & priority
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      //? name
                                      Text(
                                        user.name,
                                        style: boldTextStyle,
                                      ),

                                      //? ID
                                      Text(
                                        'ID: ${user.id}',
                                        style: normalTextStyle,
                                      ),

                                      //? Offered
                                      Text.rich(
                                        TextSpan(
                                          children: [
                                            TextSpan(
                                              text: 'Offered : ',
                                              style: normalTextStyle,
                                            ),
                                            TextSpan(
                                              text: inr(user.offered),
                                              style: boldTextStyle,
                                            ),
                                          ],
                                        ),
                                      ),

                                      //? Current
                                      Text.rich(
                                        TextSpan(
                                          children: [
                                            TextSpan(
                                              text: 'Current : ',
                                              style: normalTextStyle,
                                            ),
                                            TextSpan(
                                              text: inr(user.current),
                                              style: boldTextStyle,
                                            ),
                                          ],
                                        ),
                                      ),

                                      //? Type
                                      Text(
                                        user.type.name,
                                        style: normalTextStyle,
                                      ),

                                      //? Priority
                                      Text(
                                        '● ${user.priority.text}',
                                        style: normalTextStyle.copyWith(
                                          color: user.priority.color,
                                        ),
                                      ),
                                    ],
                                  ),

                                  //? Call Button
                                  Material(
                                    elevation: 0.7,
                                    shape: const CircleBorder(),
                                    color: Colors.white,
                                    child: InkWell(
                                      borderRadius: BorderRadius.circular(
                                        1000,
                                      ),
                                      onTap: () =>
                                          MyLauncher.call(context, user.phone),
                                      child: Padding(
                                        padding: const EdgeInsets.all(16),
                                        child: Icon(
                                          Icons.call,
                                          size: 30,
                                          color: Theme.of(context).primaryColor,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),

                              //? divider
                              const Divider(),

                              //? day & date
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  //? Due Date
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Due Date',
                                        style: normalTextStyle,
                                      ),
                                      Text(
                                        dMMMyy(user.dueDate),
                                        style: boldTextStyle.copyWith(
                                          fontSize: 16.sp,
                                        ),
                                      ),
                                    ],
                                  ),

                                  //? Level
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Level',
                                        style: normalTextStyle,
                                      ),
                                      Text(
                                        user.level.toString(),
                                        style: boldTextStyle.copyWith(
                                          fontSize: 16.sp,
                                        ),
                                      ),
                                    ],
                                  ),

                                  //? Days Left
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Days Left',
                                        style: normalTextStyle,
                                      ),
                                      Text(
                                        user.daysLeft.toString(),
                                        style: boldTextStyle.copyWith(
                                          fontSize: 16.sp,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
      },
    );
  }
}
