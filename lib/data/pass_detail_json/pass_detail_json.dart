import 'package:collection/collection.dart';

import 'pass_detail_json_data.dart';

class PassDetailJson {
  bool? status;
  String? message;
  PassDetailJsonData? data;

  PassDetailJson({this.status, this.message, this.data});

  factory PassDetailJson.fromJson(Map<String, dynamic> json) {
    return PassDetailJson(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : PassDetailJsonData.fromJson(json['data'] as Map<String, dynamic>),
    );
  }
}
