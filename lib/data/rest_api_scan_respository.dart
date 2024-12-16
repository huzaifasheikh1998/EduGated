import 'package:edugated/data/pass_detail_json/pass_detail_json_data.dart';
import 'package:edugated/domain/app_url/app_url.dart';
import 'package:edugated/domain/entities/pass_detail.dart';
import 'package:edugated/domain/failures/scan_failure.dart';
import 'package:edugated/domain/repositories/scan_repository.dart';
import 'package:edugated/network/network.dart';
import 'package:fpdart/src/either.dart';

class RestApiScanRepository implements ScanRepository {
  final Network _network;
  final AppUrl _appUrl;
  RestApiScanRepository(this._appUrl, this._network);
  @override
  Future<Either<ScanFailure, PassDetail>> scan(Map<String, String> data) =>
      _network.postFile(_appUrl.baseUrl + _appUrl.scanEndPoint, data,{}).then(
          (value) =>
              value.fold((l) => left(ScanFailure(error: l.error)), (response) {
                if (response["status"] == false) {
                  return left(ScanFailure(error: response["message"]));
                } else {
                  return right(
                      PassDetailJsonData.fromJson(response["data"]).toDomain());
                }
              }));
}
