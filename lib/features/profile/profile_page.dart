import 'package:edugated/features/profile/profile_state.dart';
import 'package:edugated/features/profile/widget/profile_tile.dart';
import 'package:edugated/resources/app_assets.dart';
import 'package:edugated/resources/app_colors.dart';
import 'package:edugated/widget/content.dart';
import 'package:edugated/widget/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'profile_cubit.dart';

class ProfilePage extends StatefulWidget {
  final ProfileCubit cubit;

  const ProfilePage({
    Key? key,
    required this.cubit,
  }) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfileState();
}

class _ProfileState extends State<ProfilePage> {
  ProfileCubit get cubit => widget.cubit;

  @override
  void initState() {
    cubit.navigator.context = context;
    cubit.onInit();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Content(
          data: "Profile",
          size: 24.h,
          weight: FontWeight.w600,
        ),
      ),
      body: BlocBuilder(
          bloc: cubit,
          builder: (context, state) {
            final profileState = state as ProfileState;
            return Column(
              children: [
                Container(
                    width: 200.h,
                    height: 200.h,
                    padding: const EdgeInsets.all(30),
                    decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(30)),
                    child: Image.network(profileState.user.image ??
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT_we7r5CWAZRO7KN7WjBPMnjp4hDlLIrVGYad4FRuh2g&s")),
                Container(
                    margin:
                        EdgeInsets.symmetric(horizontal: 30, vertical: 20.h),
                    child: Column(
                      children: [
                        ProfileTile(
                            text: profileState.user.name,
                            image: AppAssets.profile),
                        ProfileTile(
                            text: profileState.user.email,
                            image: AppAssets.email),
                        ProfileTile(
                            text: profileState.user.userType,
                            image: AppAssets.office)
                      ],
                    )),
                PrimaryButton(
                    width: 200.w,
                    title: "LogOut",
                    onTap: () => cubit.onTapLogOut())
              ],
            );
          }),
    );
  }
}
