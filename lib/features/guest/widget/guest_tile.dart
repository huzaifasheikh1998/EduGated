import 'package:edugated/domain/entities/pass.dart';
import 'package:edugated/resources/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';

class GuestTile extends StatelessWidget {
  final Pass pass;
  final bool active;
  const GuestTile({super.key, required this.pass, required this.active});

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.only(right: 15, left: 15, bottom: 10),
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: AppColors.primaryColorLight),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Container(
              //   margin: EdgeInsets.only(right: 8),
              //   padding: EdgeInsets.all(10),
              //   decoration: BoxDecoration(
              //       shape: BoxShape.circle, color: AppColors.primaryColorLight),
              //   child: Image.asset(
              //       true ? AppAssets.checkin : AppAssets.checkout,
              //       height: 40,
              //       color: AppColors.orange),
              // ),

              Container(
                  height: 40.h,
                  width: 40.h,
                  margin: EdgeInsets.only(right: 20),
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(8)),
                  child: PrettyQrView(
                    qrImage: QrImage(QrCode.fromData(
                        data: "EduGated", errorCorrectLevel: 1)),
                    decoration: PrettyQrDecoration(
                        shape: PrettyQrSmoothSymbol(
                            color: active
                                ? AppColors.orange
                                : AppColors.primaryColorDark,
                            roundFactor: 1)),
                  )),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    pass.contactName,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    pass.contactType,
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
                DateFormat('dd/MMM/yy').format(DateTime.parse(
                  pass.passDate,
                )),
                style: TextStyle(fontSize: 15),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
