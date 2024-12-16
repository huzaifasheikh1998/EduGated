import 'package:edugated/data/add_contact_json/add_contact_json.dart';
import 'package:edugated/domain/app_url/app_url.dart';
import 'package:edugated/domain/entities/response_body.dart';
import 'package:edugated/domain/failures/add_contact_failure.dart';
import 'package:edugated/domain/repositories/add_contact_repository.dart';
import 'package:edugated/network/network.dart';
import 'package:fpdart/fpdart.dart';

class RestApiAddContactRepository implements AddContactRepository {
  final Network _network;
  final AppUrl _appUrl;
  RestApiAddContactRepository(this._network, this._appUrl);

  @override
  Future<Either<AddContactFailure, ResponseBody>> addContact(
          data, file) =>
      _network
          .postFile(_appUrl.baseUrl + _appUrl.addContactEndPoint, data, file)
          .then((value) => value.fold(
              (err) => left(AddContactFailure(error: err.error)),
              (response) =>
                  right(AddContactJson.fromJson(response).toDomain())));
}
