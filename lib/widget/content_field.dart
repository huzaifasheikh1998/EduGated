import 'package:edugated/resources/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ContentField extends StatelessWidget {
  bool readOnly;
  final String hintText;
  Color? hintColor;
  final TextInputType? inputType;
  TextEditingController? controller;
  void Function()? ontap;
  ContentField(
      {super.key,
      this.controller,
      required this.hintText,
      this.readOnly = false,
      this.ontap,
      this.inputType,
      this.hintColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: TextFormField(
        readOnly: readOnly,
        onTap: ontap,
        controller: controller,
        maxLength: 50,
        keyboardType: inputType,
        style: TextStyle(fontSize: 18, color: Color.fromARGB(186, 0, 0, 0)),
        // inputFormatters: <TextInputFormatter>[
        //   FilteringTextInputFormatter.allow(
        //       RegExp("[a-zA-Z0-9!#@%&*+-/=?^_`{|}~]"))
        // ],
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(color: hintColor),
          counterText: "",
          contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide:
                BorderSide(color: AppColors.primaryColorDark, width: 2.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: AppColors.highlightGrey, width: 2.0),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(
                color: Color.fromARGB(220, 247, 123, 114), width: 2.0),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(
                color: Color.fromARGB(220, 247, 123, 114), width: 2.0),
          ),
          // errorStyle: InputDecoration.collapsed(hintText: hintText)
        ),
        validator: (value) {},
      ),
    );
  }
}
