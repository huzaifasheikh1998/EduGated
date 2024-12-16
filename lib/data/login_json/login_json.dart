import 'package:collection/collection.dart';

import 'login_json_data.dart';

class LoginJson {
  bool? status;
  String? message;
  LoginJsonData? data;

  LoginJson({this.status, this.message, this.data});

  factory LoginJson.fromJson(Map<String, dynamic> json) => LoginJson(
        status: json['status'] as bool?,
        message: json['message'] as String?,
        data: json['data'] == null
            ? null
            : LoginJsonData.fromJson(json['data'] as Map<String, dynamic>),
      );
}
