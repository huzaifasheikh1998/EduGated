import 'pass_detail_initial_params.dart';

class PassDetailState {
  final PassDetailInitialParams initialParams;
  final String? error;

  const PassDetailState({required this.initialParams, this.error});

  factory PassDetailState.initial(
          {required PassDetailInitialParams initialParams}) =>
      PassDetailState(initialParams: initialParams);

  PassDetailState copyWith(
          {PassDetailInitialParams? initialParams, String? error}) =>
      PassDetailState(
          initialParams: initialParams ?? this.initialParams,
          error: error ?? this.error);
}
