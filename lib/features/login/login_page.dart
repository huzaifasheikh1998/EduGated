import 'package:edugated/domain/entities/login.dart';
import 'package:edugated/domain/models/user_type.dart';
import 'package:edugated/features/login/login_state.dart';
import 'package:edugated/resources/app_assets.dart';
import 'package:edugated/resources/app_colors.dart';
import 'package:edugated/widget/content.dart';
import 'package:edugated/widget/content_field.dart';
import 'package:edugated/widget/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'login_cubit.dart';

class LoginPage extends StatefulWidget {
  final LoginCubit cubit;

  const LoginPage({
    Key? key,
    required this.cubit,
  }) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginState();
}

class _LoginState extends State<LoginPage> {
  LoginCubit get cubit => widget.cubit;

  @override
  void initState() {
    cubit.navigator.context = context;
    cubit.context = context;
    cubit.emailController = TextEditingController();
    cubit.passwordController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        // automaticallyImplyLeading: false,
        centerTitle: true,
        title: Content(
          data: "Login",
          size: 24.h,
          weight: FontWeight.w600,
        ),
      ),
      body: Scaffold(
        body: BlocBuilder(
            bloc: cubit,
            builder: (context, state) {
              final loginState = state as LoginState;
              return SizedBox(
                height: 0.8.sh,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          Container(
                              child: Image.asset(
                            AppAssets.logo,
                            height: 230.h,
                          )),
                          Content(
                            data: loginState.initialParams.userType ==
                                    UserType.student
                                ? "Student"
                                : loginState.initialParams.userType ==
                                        UserType.resident
                                    ? "Resident"
                                    : "Guard",
                            size: 30.h,
                            weight: FontWeight.bold,
                            color: AppColors.primaryColorDark,
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 30.w),
                        child: Column(
                          children: [
                            ContentField(
                              hintText: "Email",
                              controller: cubit.emailController,
                            ),
                            ContentField(
                              hintText: "Password",
                              controller: cubit.passwordController,
                            ),
                          ],
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 100.h, horizontal: 30.w),
                            child: PrimaryButton(
                                loading: loginState.isLoading,
                                title: "Login",
                                onTap: () => cubit.onTapLogin(Login(
                                    cubit.emailController.text,
                                    cubit.passwordController.text,
                                    loginState.initialParams.userType)))),
                      ),
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }
}
