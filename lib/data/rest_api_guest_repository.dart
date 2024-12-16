import 'package:edugated/data/guest_json/active.dart';
import 'package:edugated/data/guest_json/history.dart';
import 'package:edugated/domain/app_url/app_url.dart';
import 'package:edugated/domain/entities/pass.dart';
import 'package:edugated/domain/failures/guest_failure.dart';
import 'package:edugated/domain/repositories/guest_repository.dart';
import 'package:edugated/network/network.dart';
import 'package:fpdart/src/either.dart';

class RestApiGuestRepository implements GuestRepository {
  final Network _network;
  final AppUrl _appUrl;
  RestApiGuestRepository(this._network, this._appUrl);
  @override
  Future<Either<GuestFailure, (List<Pass>, List<Pass>)>> getGuestPass(
          Map<String, String> data) =>
      _network.postFile(_appUrl.baseUrl + _appUrl.guestPassEndPoint, data,{}).then(
          (value) => value.fold((err) => left(GuestFailure(error: err.error)),
                  (response) {
                final active = response["data"]["active"] as List;
                final history = response["data"]["history"] as List;
                return right((
                  active
                      .map((e) => Active.fromJson(e).toDomain())
                      .toList()
                      .reversed
                      .toList(),
                  history
                      .map((e) => History.fromJson(e).toDomain())
                      .toList()
                      .reversed
                      .toList(),
                ));
              }));
}
