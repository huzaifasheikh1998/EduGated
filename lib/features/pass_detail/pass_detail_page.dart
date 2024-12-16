import 'package:edugated/features/guest_pass/widget/guest_pass_tile.dart';
import 'package:edugated/features/pass_detail/pass_detail_state.dart';
import 'package:edugated/resources/app_colors.dart';
import 'package:edugated/resources/extension.dart';
import 'package:edugated/widget/content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'pass_detail_cubit.dart';

class PassDetailPage extends StatefulWidget {
  final PassDetailCubit cubit;

  const PassDetailPage({
    Key? key,
    required this.cubit,
  }) : super(key: key);

  @override
  State<PassDetailPage> createState() => _PassDetailState();
}

class _PassDetailState extends State<PassDetailPage> {
  PassDetailCubit get cubit => widget.cubit;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Content(
            data: "Pass Detail",
            size: 24.h,
            weight: FontWeight.w600,
          ),
        ),
        body: BlocBuilder(
            bloc: cubit,
            builder: (context, state) {
              final passDetailState = state as PassDetailState;
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  passDetailState.initialParams.valid
                      ? Container(
                          padding: const EdgeInsets.all(30),
                          margin: const EdgeInsets.all(30),
                          decoration: BoxDecoration(
                              color: AppColors.primaryColorLight,
                              borderRadius: BorderRadius.circular(20.r)),
                          child: Column(
                            children: [
                              Container(
                                  width: 200.h,
                                  height: 200.h,
                                  padding: const EdgeInsets.all(30),
                                  decoration: BoxDecoration(
                                      color: AppColors.white,
                                      borderRadius: BorderRadius.circular(30)),
                                  child: Image.network(cubit.initialParams
                                          .passDetail?.userImage ??
                                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT_we7r5CWAZRO7KN7WjBPMnjp4hDlLIrVGYad4FRuh2g&s")),
                              GuestPassTile(
                                  title: "Name",
                                  value:
                                      cubit.initialParams.passDetail!.userName),
                              cubit.initialParams.passDetail?.contactName ==
                                      null
                                  ? SizedBox()
                                  : cubit.initialParams.passDetail
                                              ?.contactName ==
                                          ""
                                      ? SizedBox()
                                      : GuestPassTile(
                                          title: "Guest Name",
                                          value: cubit.initialParams.passDetail!
                                              .contactName
                                              .toString()),
                              GuestPassTile(
                                  title: "Date",
                                  value: cubit
                                      .initialParams.passDetail!.passDate
                                      .toFormatDateTime(format: "dd/MMM/yy")),
                            ],
                          ),
                        )
                      : Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Center(
                              child: Content(
                                data: passDetailState.initialParams.error
                                    .toString(),
                                size: 30.h,
                                weight: FontWeight.bold,
                                color: AppColors.red,
                              ),
                            ),
                          ],
                        )
                ],
              );
            }));
  }
}
