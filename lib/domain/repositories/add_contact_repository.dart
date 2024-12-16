import 'package:edugated/domain/entities/response_body.dart';
import 'package:edugated/domain/failures/add_contact_failure.dart';
import 'package:fpdart/fpdart.dart';

abstract class AddContactRepository {
  Future<Either<AddContactFailure, ResponseBody>> addContact(
      Map<String, dynamic> data, Map<String, String> file);
}
