import 'package:edugated/domain/models/user_type.dart';
import 'package:edugated/features/login/login_initial_params.dart';
import 'package:edugated/resources/app_assets.dart';
import 'package:edugated/resources/app_colors.dart';
import 'package:edugated/widget/content.dart';
import 'package:edugated/widget/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'selection_cubit.dart';

class SelectionPage extends StatefulWidget {
  final SelectionCubit cubit;

  const SelectionPage({
    Key? key,
    required this.cubit,
  }) : super(key: key);

  @override
  State<SelectionPage> createState() => _SelectionState();
}

class _SelectionState extends State<SelectionPage> {
  SelectionCubit get cubit => widget.cubit;

  @override
  void initState() {
    cubit.navigator.context = context;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      margin: EdgeInsets.only(top: 50),
                      child: Image.asset(
                        AppAssets.logo,
                        height: 250,
                      )),
                ],
              ),
              Content(
                data: "EduGated",
                size: 30.h,
                weight: FontWeight.bold,
                color: AppColors.primaryColorDark,
              ),
            ],
          ),
          BlocBuilder(
              bloc: cubit,
              builder: (context, state) {
                return SizedBox(
                  height: 0.25.sh,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      PrimaryButton(
                          title: "Student",
                          onTap: () => cubit.onTapType(const LoginInitialParams(
                              userType: UserType.student))),
                      PrimaryButton(
                          title: "Resident",
                          onTap: () => cubit.onTapType(const LoginInitialParams(
                              userType: UserType.resident))),
                      PrimaryButton(
                          title: "Guard",
                          onTap: () => cubit.onTapType(const LoginInitialParams(
                              userType: UserType.guard)))
                    ],
                  ),
                );
              }),
        ],
      ),
    );
  }
}
