import 'package:edugated/features/login/login_initial_params.dart';
import 'package:edugated/features/selection/selection_navigator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'selection_initial_params.dart';
import 'selection_state.dart';

class SelectionCubit extends Cubit<SelectionState> {
  final SelectionInitialParams initialParams;
  final SelectionNavigator navigator;

  SelectionCubit(this.initialParams, this.navigator)
      : super(SelectionState.initial());

  onTapType(LoginInitialParams initialParams) =>
      navigator.openLogin(initialParams);
}
