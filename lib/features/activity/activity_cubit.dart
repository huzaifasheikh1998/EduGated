import 'package:edugated/domain/repositories/activity_repository.dart';
import 'package:edugated/domain/stores/user_store.dart';
import 'package:edugated/domain/use_cases/login_use_case.dart';
import 'package:edugated/features/activity/activity_navigator.dart';
import 'package:edugated/features/gate_pass/gate_pass_initial_params.dart';
import 'package:edugated/features/scan/scan_initial_params.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'activity_initial_params.dart';
import 'activity_state.dart';

class ActivityCubit extends Cubit<ActivityState> {
  final ActivityRepository activityRespository;
  final ActivityInitialParams initialParams;
  final ActivityNavigator navigator;
  final UserStore _userStore;

  ActivityCubit(this.initialParams, this.activityRespository, this.navigator,
      this._userStore)
      : super(ActivityState.initial());

  onInit() {
    emit(state.copyWith(user: _userStore.state));
  }

  onTapPass() => navigator.openGatePass(const GatePassInitialParams());
  onTapScan() => navigator.openScan(const ScanInitialParams());

  Future<void> fetchActivity() async {
    emit(state.copyWith(isLoading: true, error: null));
    await activityRespository.getActivities({'user_id': user_idd}).then((value) =>
        value.fold(
            (error) => emit(state.copyWith(error: error.error)),
            (activities) => emit(
                state.copyWith(activities: activities, isLoading: false))));
  }
}
