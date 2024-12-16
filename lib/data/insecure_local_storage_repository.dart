import 'package:edugated/domain/failures/local_storage_failure.dart';
import 'package:edugated/domain/repositories/local_storage_repository.dart';
import 'package:fpdart/fpdart.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InsecureLocalStorageRepository implements LocalStorageRepository {
  @override
  Future<Either<LocalStorageFailure, String>> getString(String key) async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      return right(prefs.getString(key) ?? '');
    } catch (ex) {
      return left(LocalStorageFailure(error: ex.toString()));
    }
  }

  @override
  Future<Either<LocalStorageFailure, bool>> setString(
      String key, String value) async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString(key, value);
      return right(true);
    } catch (ex) {
      return left(LocalStorageFailure(error: ex.toString()));
    }
  }

  @override
  Future<Either<LocalStorageFailure, bool>> getBool(String key) async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      return right(prefs.getBool(key) ?? false);
    } catch (ex) {
      return left(LocalStorageFailure(error: ex.toString()));
    }
  }

  @override
  Future<Either<LocalStorageFailure, bool>> setBool(
      String key, bool value) async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setBool(key, value);
      return right(true);
    } catch (ex) {
      return left(LocalStorageFailure(error: ex.toString()));
    }
  }
}
