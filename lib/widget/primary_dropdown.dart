import 'package:edugated/resources/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PrimaryDropDown extends StatefulWidget {
  final String labelText;
  final String? hintText;
  final List<DropdownMenuItem<String>> list;
  final void Function(String?)? onChanged;
  final String? Function(String?)? validator;

  const PrimaryDropDown(
      {super.key,
      this.validator,
      required this.labelText,
      required this.onChanged,
      required this.list,
      this.hintText});

  @override
  State<PrimaryDropDown> createState() => _PrimaryDropDownState();
}

class _PrimaryDropDownState extends State<PrimaryDropDown> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 20),
          child: Text(
            widget.labelText,
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
            ),
          ),
        ),
        4.verticalSpace,
        DropdownButtonFormField(
          icon: Icon(Icons.keyboard_arrow_down_rounded),
          hint: Text(
            widget.hintText!,
            style: TextStyle(fontSize: 16.sp),
          ),
          borderRadius: BorderRadius.circular(20.r),
          validator: widget.validator,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide:
                  BorderSide(color: AppColors.highlightGrey, width: 2.0),
            ),

            isDense: true,
            isCollapsed: true,
            contentPadding: EdgeInsets.fromLTRB(30, 16, 11, 16),
            // symmetric(vertical: 16, horizontal: 10.r),
            // enabledBorder: textFieldDecoration,
            // focusedBorder: textFieldDecoration,
            filled: true,
            fillColor: Colors.white,
          ),
          items: widget.list,
          onChanged: widget.onChanged,
        )
      ],
    );
  }
}
