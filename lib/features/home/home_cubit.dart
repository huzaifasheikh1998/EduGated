import 'package:edugated/domain/stores/user_store.dart';
import 'package:edugated/features/home/home_navigator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'home_initial_params.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeInitialParams initialParams;
  final HomeNavigator navigator;
  final UserStore _userStore;

  HomeCubit(this.initialParams, this.navigator, this._userStore)
      : super(HomeState.initial(initialParams: initialParams,user: _userStore.state));
  // onInit() {
  //   emit(state.copyWith(user: _userStore.state));
  // }

  onPageUpdate(int pageIndex) =>
      emit(state.copyWith(selectedPageIndex: pageIndex));
}
