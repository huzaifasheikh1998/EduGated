import 'package:edugated/domain/entities/pass_detail.dart';
import 'package:edugated/domain/failures/scan_failure.dart';
import 'package:edugated/domain/repositories/scan_repository.dart';
import 'package:edugated/services/scan_service.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class ScanUseCase {
  final ScanRepository _repo;
  final ScanService _service;

  ScanUseCase(this._repo, this._service);

  Future<Either<ScanFailure, PassDetail>> execute(
          BarcodeCapture capture) async =>
      await _service.execute(capture).then((value) => value.fold(
          (err) => left(ScanFailure(error: err.error)),
          (data) async => await _repo.scan(data).then((value) => value.fold(
              (err) => left(ScanFailure(error: err.error)),
              (response) => right(response)))));
}
