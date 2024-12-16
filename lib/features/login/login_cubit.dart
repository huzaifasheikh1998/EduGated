import 'package:edugated/domain/entities/login.dart';
import 'package:edugated/domain/use_cases/login_use_case.dart';
import 'package:edugated/features/home/home_initial_params.dart';
import 'package:edugated/features/login/login_navigator.dart';
import 'package:edugated/resources/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'login_initial_params.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginInitialParams initialParams;
  final LoginNavigator navigator;
  final LoginUseCase loginUseCase;

  LoginCubit(this.initialParams, this.navigator, this.loginUseCase)
      : super(LoginState.initial(initialParams: initialParams));

  late BuildContext context;
  late TextEditingController emailController;
  late TextEditingController passwordController;

  onTapLogin(Login login) {
    emit(state.copyWith(isLoading: true));
    loginUseCase.exceute(login).then((value) => value.fold((l) {
          emit(state.copyWith(isLoading: false, error: l.error));
          Utils.toastMessage(l.error, context);
        }, (r) {
          emit(state.copyWith(isLoading: false));
          Utils.toastMessage("Login Successfull", context);
          navigator.openHome(const HomeInitialParams());
        }));
  }
}
