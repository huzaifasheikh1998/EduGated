import 'login_initial_params.dart';

class LoginState {
  LoginInitialParams initialParams;
  final bool isLoading;

  final String? error;

  LoginState(
      {required this.isLoading, required this.initialParams, this.error});

  factory LoginState.initial({required LoginInitialParams initialParams}) =>
      LoginState(initialParams: initialParams, isLoading: false);

  LoginState copyWith(
          {LoginInitialParams? initialParams,
          bool? isLoading,
          String? error}) =>
      LoginState(
          initialParams: initialParams ?? this.initialParams,
          isLoading: isLoading ?? this.isLoading,
          error: error ?? this.error);
}
