import 'package:edugated/domain/entities/activity.dart';
import 'package:edugated/domain/failures/activity_failure.dart';
import 'package:fpdart/fpdart.dart';

abstract class ActivityRepository {
  Future<Either<ActivityFailure, List<Activity>>> getActivities(
      Map<String, dynamic> data);
}
