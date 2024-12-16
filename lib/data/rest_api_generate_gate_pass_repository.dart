import 'package:edugated/data/generate_gate_pass_json/generate_gate_pass_json_data.dart';
import 'package:edugated/domain/app_url/app_url.dart';
import 'package:edugated/domain/entities/pass.dart';
import 'package:edugated/domain/failures/generate_gate_pass_failure.dart';
import 'package:edugated/domain/repositories/generate_gate_pass_repository.dart';
import 'package:edugated/network/network.dart';
import 'package:fpdart/src/either.dart';

class RestApiGenerateGatePassRepository implements GenerateGatePassRepository {
  final Network _network;
  final AppUrl _appUrl;
  RestApiGenerateGatePassRepository(this._network, this._appUrl);
  @override
  Future<Either<GenerateGatePassFailure, Pass>> generatePass(
          Map<String, dynamic> data) =>
      _network
          .post(_appUrl.baseUrl + _appUrl.generateGatePassEndPoint, data)
          .then((value) => value.fold(
              (err) => left(GenerateGatePassFailure(error: err.error)),
              (response) => right(
                  GenerateGatePassJsonData.fromJson(response["data"])
                      .toDomain())));
}
