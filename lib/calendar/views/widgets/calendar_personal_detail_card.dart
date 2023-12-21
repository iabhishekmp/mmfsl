import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CalendarPersonalDetailCard extends StatelessWidget {
  const CalendarPersonalDetailCard({super.key});

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
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                //? name, priority & call
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //? name & priority
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //? name
                        Text(
                          'Abhishek Patil',
                          style: boldTextStyle,
                        ),

                        //? ID
                        Text(
                          'ID: LOREM12345',
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
                                text: r'$XXX,XXX',
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
                                text: r'$XXX,XXX',
                                style: boldTextStyle,
                              ),
                            ],
                          ),
                        ),

                        //? Priority
                        Text(
                          '● High Priority',
                          style: normalTextStyle.copyWith(
                            color: Colors.red,
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
                        onTap: () {},
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //? Due Date
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Due Date',
                          style: normalTextStyle,
                        ),
                        Text(
                          '5 June 23',
                          style: normalTextStyle,
                        ),
                      ],
                    ),

                    //? Level
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Level',
                          style: normalTextStyle,
                        ),
                        Text(
                          '10',
                          style: normalTextStyle,
                        ),
                      ],
                    ),

                    //? Days Left
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Days Left',
                          style: normalTextStyle,
                        ),
                        Text(
                          '23',
                          style: normalTextStyle,
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
  }
}
