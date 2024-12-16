import 'package:edugated/data/activity_json/datum.dart';
import 'package:edugated/domain/app_url/app_url.dart';
import 'package:edugated/domain/entities/activity.dart';
import 'package:edugated/domain/failures/activity_failure.dart';
import 'package:edugated/domain/repositories/activity_repository.dart';
import 'package:edugated/network/network.dart';
import 'package:fpdart/fpdart.dart';

class RestApiActivityRepository implements ActivityRepository {
  final Network _network;
  final AppUrl _appUrl;
  RestApiActivityRepository(this._network, this._appUrl);
  @override
  Future<Either<ActivityFailure, List<Activity>>> getActivities(data) =>
      _network.postFile(_appUrl.baseUrl + _appUrl.activityEndPoint, data,{}).then(
          (value) =>
              value.fold((l) => left(ActivityFailure(error: l.error)), (r) {
                var list = r["data"] as List;
                return right(
                    list.map((e) => Datum.fromJson(e).toDomain()).toList());
              }));
}
