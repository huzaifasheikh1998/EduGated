import 'package:edugated/domain/entities/contact.dart';
import 'package:edugated/domain/failures/contacts_failure.dart';
import 'package:fpdart/fpdart.dart';

abstract class ContactsRepository {
  Future<Either<ContactsFailure, List<Contact>>> getContacts(
      Map<String, String> data);
}
