import 'package:edugated/domain/entities/user.dart';
import 'package:edugated/domain/stores/user_store.dart';
import 'package:edugated/features/profile/profile_navigator.dart';
import 'package:edugated/features/selection/selection_initial_params.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'profile_initial_params.dart';
import 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final ProfileInitialParams initialParams;
  final UserStore _userStore;
  final ProfileNavigator navigator;

  ProfileCubit(this.initialParams, this._userStore, this.navigator)
      : super(ProfileState.initial());

  onInit() {
    emit(state.copyWith(user: _userStore.state));
  }

  onTapLogOut() {
    _userStore.setUser(User.empty());
    navigator.backToSelection(const SelectionInitialParams());
  }
}
