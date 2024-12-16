import 'package:edugated/domain/entities/login.dart';
import 'package:edugated/domain/entities/user.dart';
import 'package:edugated/domain/failures/login_failure.dart';
import 'package:edugated/domain/repositories/local_storage_repository.dart';
import 'package:edugated/domain/repositories/login_repository.dart';
import 'package:edugated/domain/stores/user_store.dart';
import 'package:edugated/domain/validator/login_validator.dart';
import 'package:fpdart/fpdart.dart';

class LoginUseCase {
  final LoginRepository _repo;
  final LoginValidator _validator;
  final UserStore _userStore;

  final LocalStorageRepository _localStorageRepository;

  LoginUseCase(this._repo, this._validator, this._userStore,
      this._localStorageRepository);

  Future<Either<LoginFailure, User>> exceute(Login login) async =>
      _validator.validate(login).fold(
          (err) => left(LoginFailure(error: err.error)),
          (data) async => await _repo.login(data).then((value) => value.fold(
              (err) => left(LoginFailure(error: err.error)),
              (response) => _localStorageRepository
                  .setString("USER_ID", response.id)
                  .then((value) => value
                          .fold((l) => left(LoginFailure(error: l.error)), (r) {
                        _userStore.setUser(response);
                        return right(response);
                      })))));
}
