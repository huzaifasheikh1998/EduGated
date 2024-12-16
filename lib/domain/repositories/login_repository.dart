import 'package:edugated/domain/entities/user.dart';
import 'package:edugated/domain/failures/login_failure.dart';
import 'package:fpdart/fpdart.dart';

abstract class LoginRepository {
  Future<Either<LoginFailure, User>> login(Map<String, String> data);
}
