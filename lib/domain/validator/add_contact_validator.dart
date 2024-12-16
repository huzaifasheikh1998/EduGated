import 'package:edugated/domain/entities/add_contact.dart';
import 'package:edugated/domain/entities/user.dart';
import 'package:edugated/domain/failures/add_contact_failure.dart';
import 'package:edugated/resources/validator.dart';
import 'package:fpdart/fpdart.dart';

class AddContactValidator {
  final Validator validator;

  AddContactValidator(this.validator);
  Either<AddContactFailure, (Map<String, String>, Map<String, String>)>
      validate(AddContact addContact) {
    if (validator.validateFullName(addContact.name) != null) {
      return left(AddContactFailure(
          error: validator.validateFullName(addContact.name)!));
    } else if (validator.validatePhone(addContact.phone, "Phone") != null) {
      return left(AddContactFailure(
          error: validator.validatePhone(addContact.phone, "Phone")!));
    } else if (validator.validate(addContact.type, "Type") != null) {
      return left(AddContactFailure(
          error: validator.validate(addContact.type, "Contact Type")!));
    } else if (validator.validate(addContact.cnicImage, "Cnic Image") != null) {
      return left(AddContactFailure(
          error: validator.validate(addContact.cnicImage, "Cnic Image")!));
    } else {
      return right((
        {
          "user_id": addContact.userId,
          "name": addContact.name,
          "phone": addContact.phone,
          "type": addContact.type,
        },
        {"cnic_image": addContact.cnicImage}
      ));
    }
  }

  // Either<AddContactFailure, Map<String, String>> validate2() {
  //   if (addContact.name != "") {
  //     return left(AddContactFailure(error: "Enter Name"));
  //   } else if (addContact.name.length < 3) {
  //     return left(AddContactFailure(error: "Enter Valid Name"));
  //   }
  //   if (addContact.phone == "") {
  //     return left(AddContactFailure(error: "Enter Phone"));
  //   }
  //   if (addContact.name.length < 3) {
  //     return left(AddContactFailure(error: "Enter Valid Phone"));
  //   }
  //   if (addContact.name == "") {
  //     return left(AddContactFailure(error: "Enter Name"));
  //   }
  //   if (addContact.name == "") {
  //     return left(AddContactFailure(error: "Enter Name"));
  //   }
  //   if (addContact.name == "") {
  //     return left(AddContactFailure(error: "Enter Name"));
  //   }
  //   if (addContact.name == "") {
  //     return left(AddContactFailure(error: "Enter Name"));
  //   }
  //   if (addContact.name == "") {
  //     return left(AddContactFailure(error: "Enter Name"));
  //   }
  //   if (addContact.name == "") {
  //     return left(AddContactFailure(error: "Enter Name"));
  //   } else {
  //     return right({
  //       "user_id": "",
  //       "name": addContact.name,
  //       "phone": addContact.phone,
  //       "type": addContact.type,
  //       "cnic_image": addContact.cnicImage
  //     });
  //   }
  // }
}
