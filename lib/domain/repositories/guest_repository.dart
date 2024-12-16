import 'package:edugated/domain/entities/pass.dart';
import 'package:edugated/domain/failures/guest_failure.dart';
import 'package:fpdart/fpdart.dart';

abstract class GuestRepository {
  Future<Either<GuestFailure, (List<Pass>, List<Pass>)>> getGuestPass(
      Map<String, String> data);
}
