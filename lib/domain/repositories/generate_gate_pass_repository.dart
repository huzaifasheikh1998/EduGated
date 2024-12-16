import 'package:edugated/domain/entities/pass.dart';
import 'package:edugated/domain/failures/generate_gate_pass_failure.dart';
import 'package:fpdart/fpdart.dart';

abstract class GenerateGatePassRepository {
  Future<Either<GenerateGatePassFailure, Pass>> generatePass(
      Map<String, dynamic> data);
}
