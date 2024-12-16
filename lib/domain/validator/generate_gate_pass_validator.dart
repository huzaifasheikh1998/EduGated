import 'package:edugated/domain/entities/generate_gate_pass.dart';
import 'package:edugated/domain/failures/generate_gate_pass_failure.dart';
import 'package:edugated/resources/extension.dart';
import 'package:edugated/resources/validator.dart';
import 'package:fpdart/fpdart.dart';

class GenerateGatePassValidator {
  final Validator validator;
  GenerateGatePassValidator(this.validator);

  Either<GenerateGatePassFailure, Map<String, String>> validate(
      GenerateGatePass generateGatePass) {
    if (validator.validate(generateGatePass.passDate, "Pass Date") != null) {
      return left(GenerateGatePassFailure(
          error: validator.validate(generateGatePass.passDate, "Pass Date")!));
    } else if (validator.validate(generateGatePass.contactId, "Contact") !=
        null) {
      return left(GenerateGatePassFailure(
          error: validator.validate(generateGatePass.contactId, "Contact")!));
    } else {
      return right(
        {
          "user_id": generateGatePass.userId,
          "contact_id": generateGatePass.contactId,
          "pass_date": generateGatePass.passDate
              .toFormatDateTime(format: "yyyy-MM-dd hh:mm:ss"),
        },
      );
    }
  }
}
