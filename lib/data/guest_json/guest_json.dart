import 'package:collection/collection.dart';

import 'data.dart';

class GuestJson {
  bool? status;
  String? message;
  Data? data;

  GuestJson({this.status, this.message, this.data});

  factory GuestJson.fromJson(Map<String, dynamic> json) => GuestJson(
        status: json['status'] as bool?,
        message: json['message'] as String?,
        data: json['data'] == null
            ? null
            : Data.fromJson(json['data'] as Map<String, dynamic>),
      );
}
