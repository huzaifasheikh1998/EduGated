import 'package:edugated/domain/use_cases/login_use_case.dart';
import 'package:edugated/features/activity/activity_initial_params.dart';
import 'package:edugated/features/activity/activity_page.dart';
import 'package:edugated/features/guest/guest_initial_params.dart';
import 'package:edugated/features/guest/guest_page.dart';
import 'package:edugated/features/home/home_state.dart';
import 'package:edugated/features/profile/profile_initial_params.dart';
import 'package:edugated/features/profile/profile_page.dart';
import 'package:edugated/main.dart';
import 'package:edugated/resources/app_assets.dart';
import 'package:edugated/resources/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'home_cubit.dart';

class HomePage extends StatefulWidget {
  final HomeCubit cubit;

  const HomePage({
    Key? key,
    required this.cubit,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomeState();
}

class _HomeState extends State<HomePage> {
  HomeCubit get cubit => widget.cubit;

  final List<Widget> _pages = [
    ActivityPage(cubit: getIt(param1: const ActivityInitialParams())),
    GuestPage(cubit: getIt(param1: const GuestInitialParams())),
    ProfilePage(cubit: getIt(param1: const ProfileInitialParams()))
  ];
  final List<Widget> _guardPages = [
    ActivityPage(cubit: getIt(param1: const ActivityInitialParams())),
    ProfilePage(cubit: getIt(param1: const ProfileInitialParams()))
  ];

  @override
  void initState() {
    // cubit.onInit();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocBuilder(
            bloc: cubit,
            builder: (context, state) {
              final homeState = state as HomeState;
              return Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  state.user.userType 
                  // user_typee
                  == "guard"
                      ? _guardPages[state.selectedPageIndex]
                      : _pages[state.selectedPageIndex],
                  state.user.userType
                  // user_typee
                   == "guard"
                      ? SafeArea(
                          child: Container(
                              margin: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 10),
                              padding: EdgeInsets.symmetric(
                                  vertical: 19, horizontal: 19),
                              decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.grey,
                                        blurRadius: 15.0,
                                        spreadRadius: 1.0,
                                        offset: Offset(-1.0, -1.0)),
                                  ],
                                  color: AppColors.navBarColor,
                                  borderRadius: BorderRadius.circular(20)),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      cubit.onPageUpdate(0);
                                    },
                                    child: AnimatedContainer(
                                      duration: Duration(seconds: 1),
                                      curve: Curves.fastLinearToSlowEaseIn,
                                      // margin: EdgeInsets.only(right: 10),
                                      padding: EdgeInsets.symmetric(
                                          vertical: 14, horizontal: 15),
                                      decoration: BoxDecoration(
                                          color:
                                              homeState.selectedPageIndex == 0
                                                  ? AppColors.primaryColorDark
                                                  : Colors.transparent,
                                          borderRadius:
                                              BorderRadius.circular(30)),
                                      child: Row(
                                        children: [
                                          Image.asset(
                                            AppAssets.activities,
                                            color:
                                                homeState.selectedPageIndex == 0
                                                    ? Colors.white
                                                    : AppColors
                                                        .primaryColorDark,
                                            height: 20,
                                          ),
                                          Text(
                                            "  Activity",
                                            style: TextStyle(
                                                color: homeState
                                                            .selectedPageIndex ==
                                                        0
                                                    ? Colors.white
                                                    : AppColors
                                                        .primaryColorDark,
                                                fontWeight: FontWeight.w600),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      cubit.onPageUpdate(1);
                                    },
                                    child: AnimatedContainer(
                                      duration: Duration(seconds: 1),
                                      curve: Curves.fastLinearToSlowEaseIn,
                                      // margin: EdgeInsets.only(right: 10),
                                      padding: EdgeInsets.symmetric(
                                          vertical: 14, horizontal: 15),
                                      decoration: BoxDecoration(
                                          color:
                                              homeState.selectedPageIndex == 1
                                                  ? AppColors.primaryColorDark
                                                  : Colors.transparent,
                                          borderRadius:
                                              BorderRadius.circular(30)),
                                      child: Row(
                                        children: [
                                          Image.asset(
                                            AppAssets.profile,
                                            color:
                                                homeState.selectedPageIndex == 1
                                                    ? Colors.white
                                                    : AppColors
                                                        .primaryColorDark,
                                            height: 20,
                                          ),
                                          Text(
                                            "  Profile",
                                            style: TextStyle(
                                                color: homeState
                                                            .selectedPageIndex ==
                                                        1
                                                    ? Colors.white
                                                    : AppColors
                                                        .primaryColorDark,
                                                fontWeight: FontWeight.w600),
                                          )
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              )),
                        )
                      : SafeArea(
                          child: Container(
                              margin: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 10),
                              padding: EdgeInsets.symmetric(
                                  vertical: 19, horizontal: 19),
                              decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.grey,
                                        blurRadius: 15.0,
                                        spreadRadius: 1.0,
                                        offset: Offset(-1.0, -1.0)),
                                  ],
                                  color: AppColors.navBarColor,
                                  borderRadius: BorderRadius.circular(20)),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      cubit.onPageUpdate(0);
                                    },
                                    child: AnimatedContainer(
                                      duration: Duration(seconds: 1),
                                      curve: Curves.fastLinearToSlowEaseIn,
                                      // margin: EdgeInsets.only(right: 10),
                                      padding: EdgeInsets.symmetric(
                                          vertical: 14, horizontal: 15),
                                      decoration: BoxDecoration(
                                          color:
                                              homeState.selectedPageIndex == 0
                                                  ? AppColors.primaryColorDark
                                                  : Colors.transparent,
                                          borderRadius:
                                              BorderRadius.circular(30)),
                                      child: Row(
                                        children: [
                                          Image.asset(
                                            AppAssets.activities,
                                            color:
                                                homeState.selectedPageIndex == 0
                                                    ? Colors.white
                                                    : AppColors
                                                        .primaryColorDark,
                                            height: 20,
                                          ),
                                          Text(
                                            "  Activity",
                                            style: TextStyle(
                                                color: homeState
                                                            .selectedPageIndex ==
                                                        0
                                                    ? Colors.white
                                                    : AppColors
                                                        .primaryColorDark,
                                                fontWeight: FontWeight.w600),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      cubit.onPageUpdate(1);
                                    },
                                    child: AnimatedContainer(
                                      duration: Duration(seconds: 1),
                                      curve: Curves.fastLinearToSlowEaseIn,
                                      // margin: EdgeInsets.only(right: 10),
                                      padding: EdgeInsets.symmetric(
                                          vertical: 14, horizontal: 15),
                                      decoration: BoxDecoration(
                                          color:
                                              homeState.selectedPageIndex == 1
                                                  ? AppColors.primaryColorDark
                                                  : Colors.transparent,
                                          borderRadius:
                                              BorderRadius.circular(30)),
                                      child: Row(
                                        children: [
                                          Image.asset(
                                            AppAssets.employees,
                                            color:
                                                homeState.selectedPageIndex == 1
                                                    ? Colors.white
                                                    : AppColors
                                                        .primaryColorDark,
                                            height: 24,
                                          ),
                                          Text(
                                            "  Guest",
                                            style: TextStyle(
                                                color: homeState
                                                            .selectedPageIndex ==
                                                        1
                                                    ? Colors.white
                                                    : AppColors
                                                        .primaryColorDark,
                                                fontWeight: FontWeight.w600),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      cubit.onPageUpdate(2);
                                    },
                                    child: AnimatedContainer(
                                      duration: Duration(seconds: 1),
                                      curve: Curves.fastLinearToSlowEaseIn,
                                      // margin: EdgeInsets.only(right: 10),
                                      padding: EdgeInsets.symmetric(
                                          vertical: 14, horizontal: 15),
                                      decoration: BoxDecoration(
                                          color:
                                              homeState.selectedPageIndex == 2
                                                  ? AppColors.primaryColorDark
                                                  : Colors.transparent,
                                          borderRadius:
                                              BorderRadius.circular(30)),
                                      child: Row(
                                        children: [
                                          Image.asset(
                                            AppAssets.profile,
                                            color:
                                                homeState.selectedPageIndex == 2
                                                    ? Colors.white
                                                    : AppColors
                                                        .primaryColorDark,
                                            height: 20,
                                          ),
                                          Text(
                                            "  Profile",
                                            style: TextStyle(
                                                color: homeState
                                                            .selectedPageIndex ==
                                                        2
                                                    ? Colors.white
                                                    : AppColors
                                                        .primaryColorDark,
                                                fontWeight: FontWeight.w600),
                                          )
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              )),
                        ),
                ],
              );
            }));
  }
}
