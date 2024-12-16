import 'package:edugated/domain/use_cases/login_use_case.dart';
import 'package:edugated/features/activity/activity_state.dart';
import 'package:edugated/features/activity/widget/activity_tile.dart';
import 'package:edugated/resources/app_assets.dart';
import 'package:edugated/resources/app_colors.dart';
import 'package:edugated/resources/utils.dart';
import 'package:edugated/widget/content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';
import 'activity_cubit.dart';

class ActivityPage extends StatefulWidget {
  final ActivityCubit cubit;

  const ActivityPage({
    Key? key,
    required this.cubit,
  }) : super(key: key);

  @override
  State<ActivityPage> createState() => _ActivityState();
}

class _ActivityState extends State<ActivityPage> {
  ActivityCubit get cubit => widget.cubit;

  @override
  void initState() {
    cubit.navigator.context = context;
    cubit.onInit();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                   Padding(
                        padding: const EdgeInsets.all(20),
                        child: GestureDetector(
                            child: Icon(
                              Icons.replay_outlined,
                              color:Colors.transparent,
                            )),
                      ),
                  BlocBuilder(
                      bloc: cubit,
                      builder: (context, state) {
                        final activityState = state as ActivityState;
                  
                        return
                         user_typee
                                //  activityState.user.userType
                                ==
                                "guard"
                            ? GestureDetector(
                                onTap: () => cubit.onTapScan(),
                                child: Container(
                                    margin: const EdgeInsets.only(top: 20, bottom: 7),
                                    padding: const EdgeInsets.all(20),
                                    decoration: BoxDecoration(
                                        color: AppColors.primaryColorLight,
                                        borderRadius: BorderRadius.circular(30)),
                                    child: Image.asset(
                                      AppAssets.scanner,
                                      height: 80.h,
                                      width: 80.h,
                                      color: AppColors.primaryColorDark,
                                    )),
                              )
                            : GestureDetector(
                                onTap: () => cubit.onTapPass(),
                                child: Container(
                                  margin: const EdgeInsets.only(top: 20, bottom: 7),
                                  padding: const EdgeInsets.all(20),
                                  decoration: BoxDecoration(
                                      color: AppColors.primaryColorLight,
                                      borderRadius: BorderRadius.circular(30)),
                                  child: PrettyQr(
                                    elementColor: AppColors.primaryColorDark,
                                    size: 80.h,
                                    data: "attendeesQr",
                                    errorCorrectLevel: QrErrorCorrectLevel.M,
                                    roundEdges: true,
                                  ),
                                ),
                              );
                      }),
                       Padding(
                        padding: const EdgeInsets.all(20),
                        child: GestureDetector(
                            onTap: () => cubit.fetchActivity(),
                            child: Icon(
                              Icons.replay_outlined,
                              color: AppColors.primaryColorDark,
                            )),
                      )
                ],
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {},
              child: Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: const Text(
                  "Activities",
                  style: TextStyle(fontSize: 21, fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ],
        ),
        BlocBuilder(
            bloc: cubit,
            builder: (context, state) {
              final activityState = state as ActivityState;

              if (activityState.error != null) {
                return Center(
                    child: Content(data: activityState.error!, size: 20));
              } else if (activityState.isLoading) {
                return Utils.showLoading(context);
              } else {
                if (activityState.activities.isEmpty) {
                  return SizedBox(
                      height: 0.4.sh,
                      child: Center(
                          child: Content(data: "No Activity Found", size: 20)));
                } else {
                  return ListView.separated(
                    shrinkWrap: true,
                    itemCount: activityState.activities.length,
                    itemBuilder: (context, index) {
                      final iteration = activityState.activities[index];
                      return ActivityTile(
                        activity: iteration,
                      );
                    },
                    separatorBuilder: (context, index) => 15.verticalSpace,
                  );
                }
              }
            })
      ],
    )));
  }
}
