import 'package:edugated/domain/entities/login.dart';
import 'package:edugated/domain/failures/login_failure.dart';
import 'package:edugated/resources/validator.dart';
import 'package:fpdart/fpdart.dart';

class LoginValidator {
  final Validator validator;
  LoginValidator(this.validator);

  Either<LoginFailure, Map<String, String>> validate(Login login) {
    if (validator.validateEmail(login.email) != null) {
      return left(LoginFailure(error: validator.validateEmail(login.email)!));
    } else if (validator.validate(login.password, "Password") != null) {
      return left(
          LoginFailure(error: validator.validate(login.password, "Password")!));
    } else {
      return right(
        {
          "user_type": login.userType.name,
          "email": login.email,
          "password": login.password,
        },
      );
    }
  }
}
