import 'package:edugated/domain/entities/user.dart';
import 'package:edugated/domain/failures/users_list_failure.dart';
import 'package:fpdart/fpdart.dart';

abstract class UsersRepository {
  Future<Either<UsersListFailure, List<User>>> getUsers();
}
