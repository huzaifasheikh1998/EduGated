import 'package:edugated/resources/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PrimaryButton extends StatelessWidget {
  final bool loading;
  final String title;
  final String? icons;
  final VoidCallback onTap;
  final double width;
  final Color outlineColor;
  final Color fillColor;
  final Color textColor;
  const PrimaryButton(
      {super.key,
      required this.title,
      this.icons,
      required this.onTap,
      this.loading = false,
      this.width = 380,
      this.outlineColor = const Color(0xffFFFFFF),
      this.fillColor = AppColors.primaryColorDark,
      this.textColor = Colors.white});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: loading ? () {} : onTap,
      child: Container(
        width: width.w,
        height: 60.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(33.r),
          border: Border.all(width: 1.w, color: outlineColor
              //  Color(0xffFFFFFF),
              ),
          color: fillColor,
        ),
        child: loading
            ? const Center(
                child: CircularProgressIndicator(
                color: Colors.white,
              ))
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  icons != null
                      ? Padding(
                          padding: EdgeInsets.only(right: 15.w),
                          child: Image.asset(
                            icons!,
                            scale: 3,
                            color: textColor,
                          ),
                        )
                      : const SizedBox(),
                  Center(
                    child: Text(
                      title,
                      style: TextStyle(
                        fontFamily: "Roboto, Bold",
                        fontSize: 20.sp,
                        color: textColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
