import 'package:edugated/data/contacts_json/contact_json.dart';
import 'package:edugated/domain/app_url/app_url.dart';
import 'package:edugated/domain/entities/contact.dart';
import 'package:edugated/domain/failures/contacts_failure.dart';
import 'package:edugated/domain/repositories/contacts.repository.dart';
import 'package:edugated/network/network.dart';
import 'package:fpdart/src/either.dart';

class RestApiContactsRepository implements ContactsRepository {
  final Network _network;
  final AppUrl _appUrl;
  RestApiContactsRepository(this._appUrl, this._network);
  @override
  Future<Either<ContactsFailure, List<Contact>>> getContacts(
          Map<String, String> data) =>
      _network.postFile(_appUrl.baseUrl + _appUrl.contactsEndPoint, data,{}).then(
          (value) =>
              value.fold((l) => left(ContactsFailure(error: l.error)), (r) {
                var list = r["data"] as List;
                return right(list
                    .map((e) => ContactJson.fromJson(e).toDomain())
                    .toList());
              }));
}
