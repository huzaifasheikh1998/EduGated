import 'dart:developer';

import 'package:edugated/domain/entities/generate_gate_pass.dart';
import 'package:edugated/domain/entities/pass.dart';
import 'package:edugated/domain/failures/generate_gate_pass_failure.dart';
import 'package:edugated/domain/repositories/generate_gate_pass_repository.dart';
import 'package:edugated/domain/validator/generate_gate_pass_validator.dart';
import 'package:fpdart/fpdart.dart';

class GenerateGatePassUseCase {
  final GenerateGatePassRepository _repo;
  final GenerateGatePassValidator _validator;
  GenerateGatePassUseCase(this._repo, this._validator);

  Future<Either<GenerateGatePassFailure, Pass>> execute(
          GenerateGatePass generateGatePass) async =>
      _validator
          .validate(generateGatePass)
          .fold((err) => left(GenerateGatePassFailure(error: err.error)),
              (data) async {
        log(data.toString(), name: "GenerateGatePassData");
        return await _repo.generatePass(data).then(
            (value) => value.fold((err) => left(err), (pass) => right(pass)));
      });
}
