import 'package:edugated/domain/entities/response_body.dart';

class AddContactJson {
  bool? status;
  String? message;

  AddContactJson({this.status, this.message});

  factory AddContactJson.fromJson(Map<String, dynamic> json) {
    return AddContactJson(
        status: json['status'] as bool?, message: json['message'] as String?);
  }

  ResponseBody toDomain() =>
      ResponseBody(status: status, message: message ?? "");
}
