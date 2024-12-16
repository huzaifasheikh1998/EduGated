import 'package:edugated/domain/entities/pass_detail.dart';
import 'package:edugated/domain/failures/scan_failure.dart';
import 'package:fpdart/fpdart.dart';

abstract class ScanRepository {
  Future<Either<ScanFailure, PassDetail>> scan(Map<String, String> data);
}
