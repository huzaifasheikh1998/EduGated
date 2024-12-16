import 'package:edugated/domain/failures/network_failure.dart';
import 'package:fpdart/fpdart.dart';

abstract class Network {
  Future<Either<NetworkFailure, dynamic>> get(String url);
  Future<Either<NetworkFailure, dynamic>> post(
      String url, Map<String, dynamic> data);
  Future<Either<NetworkFailure, dynamic>> postFile(
      String url, Map<String, dynamic> data, Map<String, String> file);
}
