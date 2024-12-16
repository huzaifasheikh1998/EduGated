import 'package:edugated/domain/use_cases/scan_use_case.dart';
import 'package:edugated/features/pass_detail/pass_detail_initial_params.dart';
import 'package:edugated/features/scan/scan_navigator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'scan_initial_params.dart';
import 'scan_state.dart';

class ScanCubit extends Cubit<ScanState> {
  final ScanInitialParams initialParams;
  final ScanNavigator navigator;
  final ScanUseCase _useCase;

  ScanCubit(this.initialParams, this.navigator, this._useCase)
      : super(ScanState.initial());

  late MobileScannerController scanController;

  onQrDetection(BarcodeCapture capture) {
    emit(state.copyWith(isLoading: true));
    _useCase.execute(capture).then((value) => value.fold((l) {
          emit(state.copyWith(error: l.error, isLoading: false));
          navigator.openPassDetail(
              PassDetailInitialParams(valid: false, error: l.error));
        }, (r) {
          emit(state.copyWith(isLoading: false));
          navigator.openPassDetail(
              PassDetailInitialParams(valid: true, passDetail: r));
        }));
  }
}
