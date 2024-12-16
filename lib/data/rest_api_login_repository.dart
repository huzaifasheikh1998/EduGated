import 'package:edugated/data/login_json/login_json_data.dart';
import 'package:edugated/domain/app_url/app_url.dart';
import 'package:edugated/domain/entities/user.dart';
import 'package:edugated/domain/failures/login_failure.dart';
import 'package:edugated/domain/repositories/login_repository.dart';
import 'package:edugated/network/network.dart';
import 'package:fpdart/src/either.dart';

class RestApiLoginRespository implements LoginRepository {
  final Network _network;
  final AppUrl _appUrl;

  RestApiLoginRespository(this._appUrl, this._network);

  @override
  Future<Either<LoginFailure, User>> login(Map<String, String> data) => _network
      .postFile(_appUrl.baseUrl + _appUrl.loginEndPoint, data,{})
      .then((value) =>
          value.fold((l) => left(LoginFailure(error: l.error)), (response) {
            if (response["status"] == false) {
              return left(LoginFailure(error: response["message"]));
            } else {
              return right(LoginJsonData.fromJson(response["data"]).toDomain());
            }
          }));
}
