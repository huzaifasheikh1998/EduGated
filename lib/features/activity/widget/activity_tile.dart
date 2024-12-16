import 'package:edugated/domain/entities/activity.dart';
import 'package:edugated/domain/entities/pass.dart';
import 'package:edugated/resources/app_assets.dart';
import 'package:edugated/resources/app_colors.dart';
import 'package:flutter/material.dart';

class ActivityTile extends StatelessWidget {
  final Activity activity;
  const ActivityTile({super.key, required this.activity});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 15, left: 15, bottom: 10),
      padding: EdgeInsets.only(right: 20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: AppColors.primaryColorLight),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: EdgeInsets.only(right: 8),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: AppColors.primaryColorLight),
                child: Image.asset(
                    true ? AppAssets.checkin : AppAssets.checkout,
                    height: 40,
                    color: AppColors.orange),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    activity.contactName == ""
                        ? activity.userName
                        : activity.contactName == "null"
                            ? activity.userName
                            : activity.contactName,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    activity.scanAt.toFormatDateTime(format: "dd/MMM/yy"),
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ],
          ),
          Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "",
                // "DateFormat('hh:mm a').format(DateTime.parse(date))",
                style: TextStyle(fontSize: 15),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
