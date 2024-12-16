import 'package:edugated/features/gate_pass/gate_pass_navigator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'gate_pass_initial_params.dart';
import 'gate_pass_state.dart';

class GatePassCubit extends Cubit<GatePassState> {
  final GatePassInitialParams initialParams;
  final GatePassNavigator navigator;

  GatePassCubit(this.initialParams, this.navigator)
      : super(GatePassState.initial(initialParams: initialParams));
}
