import 'package:edugated/resources/app_colors.dart';
import 'package:edugated/widget/content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GuestPassTile extends StatelessWidget {
  final String title;
  final String value;

  const GuestPassTile({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20.h),
      padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r), color: AppColors.white),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Content(
            data: "$title :   ",
            size: 20.h,
            color: AppColors.greyColor,
            weight: FontWeight.w600,
          ),
          Content(
            data: value,
            size: 25.h,
            color: AppColors.black,
            weight: FontWeight.w600,
          )
        ],
      ),
    );
  }
}
