import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:edugated/domain/entities/add_contact.dart';
import 'package:edugated/domain/use_cases/login_use_case.dart';
import 'package:edugated/features/add_contact/add_contact_state.dart';
import 'package:edugated/resources/app_colors.dart';
import 'package:edugated/widget/content_field.dart';
import 'package:edugated/widget/primary_button.dart';
import 'package:edugated/widget/primary_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'add_contact_cubit.dart';

class AddContactPage extends StatefulWidget {
  final AddContactCubit cubit;

  const AddContactPage({
    Key? key,
    required this.cubit,
  }) : super(key: key);

  @override
  State<AddContactPage> createState() => _AddContactState();
}

class _AddContactState extends State<AddContactPage> {
  AddContactCubit get cubit => widget.cubit;
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  TextEditingController typeController = TextEditingController();

  @override
  void initState() {
    super.initState();
    cubit.context = context;
  }

  @override
  void dispose() {
    nameController.clear();
    phoneController.clear();
    typeController.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.7),
      body: Center(
        child: Container(
          height: 0.8.sh,
          width: 0.9.sw,
          padding: EdgeInsets.all(15.r),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.r),
              color: const Color(0xffFFFFFF)),
          child: BlocBuilder(
              bloc: cubit,
              builder: (context, state) {
                final addContactState = state as AddContactState;
                return Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Icon(
                          Icons.close,
                          color: Colors.transparent,
                        ),
                        Text(
                          "Add Contact",
                          style: TextStyle(
                              color: AppColors.primaryColorDark,
                              fontSize: 22.r,
                              fontWeight: FontWeight.w700),
                        ),
                        GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: const Icon(
                              Icons.close,
                              color: AppColors.primaryColorDark,
                            ))
                      ],
                    ),
                    Column(
                      children: [
                        ContentField(
                            controller: nameController, hintText: "Name"),
                        ContentField(
                          controller: phoneController,
                          hintText: "Phone",
                          inputType: TextInputType.number,
                        ),
                        PrimaryDropDown(
                          labelText: 'Pass Type',
                          hintText: 'Select Contact Type',
                          list:
                              ['Family', 'Friend', "Guest"].map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                style: TextStyle(
                                    color: Colors.black, fontSize: 16.sp),
                              ),
                            );
                          }).toList(),
                          onChanged: (value) {
                            typeController.text = value.toString();
                          },
                        ),
                        25.verticalSpace,
                        GestureDetector(
                          // onTap: () async {
                          //   final picker = ImagePicker();

                          //   final pickedFile = await picker.pickImage(
                          //       source: ImageSource.gallery);
                          // },

                          onTap: () async => await cubit.onTapUploadImage(),
                          child: Container(
                            height: 250.h,
                            child: DottedBorder(
                                borderType: BorderType.RRect,
                                radius: Radius.circular(20.r),
                                dashPattern: [5, 5],
                                color: AppColors.primaryColorDark,
                                strokeWidth: 1,
                                child: addContactState.contactImage == null
                                    ? Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Icon(
                                                Icons.photo_outlined,
                                                color:
                                                    AppColors.primaryColorDark,
                                              ),
                                              20.horizontalSpace,
                                              Text(
                                                "Upload Cnic Image",
                                                style: TextStyle(
                                                  fontFamily: "Roboto, Bold",
                                                  fontSize: 16.sp,
                                                  color: AppColors
                                                      .primaryColorDark,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              )
                                            ],
                                          ),
                                        ],
                                      )
                                    : Container(
                                        width: 380.w,
                                        // height: 121.h,
                                        clipBehavior: Clip.hardEdge,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20.r),
                                        ),
                                        child: Image.file(
                                          File(addContactState.contactImage
                                              .toString()),
                                          fit: BoxFit.contain,
                                        ))),
                          ),
                        ),
                      ],
                    ),
                    PrimaryButton(
                        loading: state.isLoading,
                        title: 'Add',
                        onTap: () {
                          cubit.onTapAdd(AddContact(
                              userId:user_idd??"0",
                              name: nameController.text,
                              phone: phoneController.text,
                              type: typeController.text,
                              cnicImage: state.contactImage ?? ""));
                        }),
                  ],
                );
              }),
        ),
      ),
    );
  }
}
