import 'package:edugated/domain/entities/add_contact.dart';
import 'package:edugated/domain/entities/response_body.dart';
import 'package:edugated/domain/failures/add_contact_failure.dart';
import 'package:edugated/domain/repositories/add_contact_repository.dart';
import 'package:edugated/domain/validator/add_contact_validator.dart';
import 'package:fpdart/fpdart.dart';

class AddContactUseCase {
  final AddContactRepository _repo;
  final AddContactValidator _addContactValidator;

  AddContactUseCase(this._repo, this._addContactValidator);

  Future<Either<AddContactFailure, ResponseBody>> execute(
          AddContact addContact) async =>
      _addContactValidator.validate(addContact).fold(
          (err) => left(AddContactFailure(error: err.error)),
          (data) async => await _repo.addContact(data.$1, data.$2).then(
              (value) => value.fold(
                  (err) => left(AddContactFailure(error: err.error)),
                  (response) => right(response))));
}
