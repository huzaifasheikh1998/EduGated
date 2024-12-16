import 'datum.dart';

class ActivityJson {
  bool? status;
  String? message;
  List<Datum>? data;

  ActivityJson({this.status, this.message, this.data});

  factory ActivityJson.fromJson(Map<String, dynamic> json) => ActivityJson(
        status: json['status'] as bool?,
        message: json['message'] as String?,
        data: (json['data'] as List<dynamic>?)
            ?.map((e) => Datum.fromJson(e as Map<String, dynamic>))
            .toList(),
      );
}
