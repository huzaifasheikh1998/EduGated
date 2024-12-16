import 'package:edugated/resources/utils.dart';
import 'package:edugated/services/screen_capture.dart';
import 'package:edugated/services/share_file.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'guest_pass_initial_params.dart';
import 'guest_pass_state.dart';

class GuestPassCubit extends Cubit<GuestPassState> {
  final ScreenCapture screenCapture;
  final ShareFile shareFile;
  final GuestPassInitialParams initialParams;

  GuestPassCubit(this.initialParams, this.screenCapture, this.shareFile)
      : super(GuestPassState.initial());

  late BuildContext context;

  onTapShare(GlobalKey key) async {
    emit(state.copyWith(isLoading: true));
    await screenCapture.capture(key).then((value) => value.fold((err) {
          Utils.toastMessage(err.error, context);
          emit(state.copyWith(error: err.error, isLoading: false));
        },
            (file) => shareFile.share(file).then((value) => value.fold((err) {
                  Utils.toastMessage(err.error, context);
                  emit(state.copyWith(error: err.error, isLoading: false));
                }, (r) => emit(state.copyWith(isLoading: false))))));
  }
}
