import 'package:edugated/domain/failures/local_storage_failure.dart';
import 'package:fpdart/fpdart.dart';

abstract class LocalStorageRepository {
  Future<Either<LocalStorageFailure, bool>> setString(String key, String value);

  Future<Either<LocalStorageFailure, String>> getString(String key);

  Future<Either<LocalStorageFailure, bool>> setBool(String key, bool value);

  Future<Either<LocalStorageFailure, bool>> getBool(String key);
}
